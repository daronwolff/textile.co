class Clock < ActiveRecord::Base
  belongs_to :employee
  belongs_to :moment
  validates :employee,presence: true  
  scope :search_date, -> (date) { where(:date => date.to_datetime.beginning_of_day..date.to_datetime.end_of_day) }
end
