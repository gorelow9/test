class Department < ApplicationRecord
	serialize :names, Hash
	attr_accessor :date
	before_validation :concatenate
	has_many :bounds
	has_many :employees, through: :bounds
	validates :foundation, :disbandment, :current_name, :date, presence: true


	def concatenate
		self.names[date.to_date] = self.current_name
	end
end
