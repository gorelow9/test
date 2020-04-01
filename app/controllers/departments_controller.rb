class DepartmentsController < ApplicationController
	before_action :set_department, only: [:edit, :update, :change_name]
	def index
		@departments = Department.all
	end

	def edit
	end

	def change_name
	end

	def update
		if @department.update(department_params)
      redirect_to action: "index", notice: 'Department was successfully updated.'
    else
      render :edit
    end
	end

	def new
	end

	def report
		if params[:date].nil?
			@date = Date.today
		else
			@date = params[:date].to_date
		end
		@departments = Department.where(disbandment: nil).where('foundation <= ?', @date) + Department.where.not(disbandment: nil).where('foundation <= ? AND disbandment >= ?', @date, @date)
		
		respond_to do |format|
      format.html 
    end
	end

	def create
		@department = Department.new(department_params)
    if @department.save
      redirect_to action: "index"
    else
      render "new"
    end
	end

	private 

		def set_department
			@department = Department.find(params[:id])
		end

		def department_params
			params.require(:department).permit(:current_name, :date, :foundation, :disbandment)
		end
end
