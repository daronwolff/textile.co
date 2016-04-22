class Employee < ActiveRecord::Base
  belongs_to :department
  validates :first_name,presence: true
  validates :last_name,presence: true
  validates :mail,presence: true,uniqueness:true
end
