class CarsController < ApplicationController
	before_action :authenticate_user!

	def create
		@trip = Trip.find(params[:trip_id])
		@car = @trip.cars.create(car_params)
		redirect_to trip_path(@trip)
	end

	def destroy
		trip = Trip.find(params[:trip_id])
		@car = trip.cars.find(params[:id])
		@car.destroy
		redirect_to trip_path(trip)
	end

	private
		def car_params
			params.require(:car).permit(:title, :capacity)
		end
end
