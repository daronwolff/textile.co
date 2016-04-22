class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_departments, only: [:new,:edit]
  before_action :authenticate_admin!

  def index
    @employees = Employee.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  end

  def new
    @employee = Employee.new
  end


  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
      code =params[:id].to_s.rjust(5, '0')
      @barcode = generate_barcode(code)
     end
    def generate_barcode(data)
      require 'barby'
      require 'barby/barcode/code_128'
      require 'barby/outputter/html_outputter'
      @barcode = Barby::Code128B.new(data)
    end
    def set_departments
      @departments = Department.all
    end
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :mail, :birth, :department_id)
    end
end
