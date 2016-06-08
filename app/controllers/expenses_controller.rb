class ExpensesController < ApplicationController
	before_action :authenticate_user!

	def create
		@trip = Trip.find(params[:trip_id])
		@expense = @trip.expenses.create(expense_params)
		@expense.author_id = current_user.id
		@expense.update(expense_params)

		redirect_to trip_expenses_path(@trip)
	end

	def destroy
		@trip = Trip.find(params[:trip_id])
		@expense = @trip.expenses.find(params[:id])
		@expense.destroy
		redirect_to trip_expenses_path(@trip)
	end

	def index
		@trip = Trip.find(params[:trip_id])
		@expenses = @trip.expenses.all
	end

	private
		def expense_params
			params.require(:expense).permit(:author, :cost, :payee, :title)
		end
end
