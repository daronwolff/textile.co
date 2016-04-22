class ClocksController < ApplicationController

  before_action :authenticate_admin!, except: [:new,:create,:show,:error]
  before_action :get_last_moment,only: [:create]
  
  def index
    @clocks = Clock.paginate(:page => params[:page], :per_page => 10)
    
  end

  def show
     @clock = Clock.find(params[:id])     
     @employee = Employee.find(@clock.employee)
  end

  def new
    @clock = Clock.new
  end

  def error
  end

  def create

    @employee = Employee.find_by_id(params[:clock][:employee].to_i)
    if @employee.nil?
      render :error,:locals=>{error_title: "Error",message: "The entered code does not exist or is invalid"}
      return false
    end

    arrival_time = @employee.department.arrival_time
    tolerance_time = @employee.department.tolerance.to_i
    evaluate = check_entry(arrival_time,DateTime.now,tolerance_time)
    moment = get_next_moment

    if moment <= @last_moment
      @clock = Clock.new(date: DateTime.now,  moment_id: moment,employee:@employee,evaluation:evaluate,diference:0)
      respond_to do |format|
        if @clock.save
          format.html { redirect_to @clock, notice: 'Clock was successfully created.' }
          format.json { render :show, status: :created, location: @clock }
        else
          format.html { render :new }
          format.json { render json: @clock.errors, status: :unprocessable_entity }
        end
      end
    else
      render :error,:locals=>{error_title: "Action no required",message: "All entries have been recorded"}
      return false
    end
  end

  private
    def check_entry(department_time,begin_work,consideration)
        end_tolerance = department_time + ((consideration/60.0)/24.0)
        if begin_work > end_tolerance
           return 0
        else
           return 1
        end
    end

    def get_next_moment
      records_today = Clock.where("Date(date) >=  ? and employee_id = ? ",Date.today.to_s,@employee).last
      if records_today.nil?
        return 1
      else
        return records_today.moment.id.to_i + 1
      end
    end

    def get_last_moment
      @last_moment =  Moment.last.id.to_i
    end
end
