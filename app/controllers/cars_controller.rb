class CarsController < ApplicationController
	before_action :authenticate_user!

	def create
		@trip = Trip.find(params[:trip_id])
		@car = @trip.cars.create(car_params)
		@car.author_id = current_user.id
		@car.driver_id = current_user.id
		@car.update(car_params)

		redirect_to trip_cars_path(@trip)
	end

	def destroy
		@trip = Trip.find(params[:trip_id])
		@car = @trip.cars.find(params[:id])
		@car.destroy
		redirect_to trip_cars_path(@trip)
	end

	def index
		@trip = Trip.find(params[:trip_id])
		@cars = @trip.cars.all
	end

	private
		def car_params
			params.require(:car).permit(:author, :capacity, :driver)
		end
end
