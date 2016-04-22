class Employee < ActiveRecord::Base
  belongs_to :department
  validates :first_name,presence: true
  validates :last_name,presence: true
  validates :mail,presence: true,uniqueness:true
  scope :search_date, -> (date) { where(:date => date.to_datetime.beginning_of_day..date.to_datetime.end_of_day) }
end
