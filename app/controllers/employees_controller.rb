class EmployeesController < ApplicationController
	before_action :set_employee, only: [:edit, :update]
	def index
		@employees = Employee.all
	end

	def edit
	end

	def update
		if @employee.update(employee_params)
      redirect_to action: "index", notice: 'Employee was successfully updated.'
    else
      render :edit
    end
	end

	def create
		@employee = Employee.new(employee_params)
    if @employee.save
      redirect_to action: "index"
    else
      render "new"
    end
	end

	private 

		def set_employee
			@employee = Employee.find(params[:id])
		end

		def employee_params
			params.require(:employee).permit(:FIO, :last_name, :first_name, :third_name)
		end
end
