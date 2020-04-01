class Bound < ApplicationRecord
	belongs_to :department
	belongs_to :employee
	validates :start_date, :department_id, :end_date, presence: true 
	validate :start_date_check
	validate :date_connection

	def start_date_check
		department = Department.find(self.department_id)
		if department.disbandment.nil?
			if department.foundation.to_date > self.start_date.to_date
				errors.add(:start_time, "Start date can't be earlier than department foundation date")
			end
		else
			unless self.start_date >= department.foundation && self.end_date <= department.disbandment
				errors.add(:start_time, "Start date can't be earlier than department foundation date")
			end
		end
	end

	def date_connection
		if self.end_date.nil?
			if Bound.where(end_date: nil, employee_id: self.employee_id).where("start_date >= ?", self.start_date).count > 0 || Bound.where("start_date >= ? AND end_date <= ?", self.start_date, self.start_date).count > 0 
				errors.add(:start_time, "This employee already attached to department")
			end
		else
			if Bound.where(end_date: nil, employee_id: self.employee_id).where("start_date >= ?", self.start_date).count > 0 || Bound.where("start_date >= ? AND end_date <= ?", self.start_date, self.end_date).count > 0 
				errors.add(:start_time, "This employee already attached to department")
			end
		end
	end

end
