class Employee < ApplicationRecord
	attr_accessor :last_name
	attr_accessor :first_name
	attr_accessor :third_name
	has_many :bounds
	has_many :departments, through: :bounds
	validates :last_name, :first_name, :third_name, presence: true
	before_save :concatenate

	def concatenate
		self.FIO = "#{first_name} #{last_name} #{third_name}"
	end
end
