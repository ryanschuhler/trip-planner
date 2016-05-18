class ExpensesController < ApplicationController
	before_action :authenticate_user!

	def create
		@trip = Trip.find(params[:trip_id])
		@expense = @trip.expenses.create(expense_params)
		redirect_to trip_path(@trip)
	end

	def destroy
		trip = Trip.find(params[:trip_id])
		@expense = trip.expenses.find(params[:id])
		@expense.destroy
		redirect_to trip_path(trip)
	end

	private
		def expense_params
			params.require(:expense).permit(:title, :cost)
		end
end
