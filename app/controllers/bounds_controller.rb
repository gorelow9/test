class BoundsController < ApplicationController

	def new
	end

	def create
		@bound = Bound.new(bound_params)
    if @bound.save
      redirect_to controller: "employees", action: "index"
    else
      render "new"
    end
	end

	private 

		def bound_params
			params.require(:bound).permit(:employee_id, :department_id, :start_date, :end_date)
		end
end
