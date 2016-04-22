class Clock < ActiveRecord::Base
  belongs_to :employee
  belongs_to :moment
end
