class Department < ActiveRecord::Base
		# Validations
	validates :name, presence: true, uniqueness:true,length:{minimum:3}
	validates :description, presence: true
end

