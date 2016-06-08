class TripsController < ApplicationController
	before_action :authenticate_user!

	def create
		@trip = Trip.new(trip_params)
		@trip.author_id = current_user.id

		if @trip.save
			redirect_to @trip
		else
			render 'new'
		end
	end

	def dashboard
		@trip = Trip.find(params[:id])
		@user = current_user
	end

	def destroy
		@trip = Trip.find(params[:id])

		@trip.destroy

		redirect_to trips_path
	end

	def edit
		@trip = Trip.find(params[:id])
		@user = current_user
	end

	def index
		@trips = Trip.all
		@user = current_user
	end

	def new
		@trip = Trip.new
		@user = current_user
	end

	def show
		@trip = Trip.find(params[:id])
		@user = current_user
	end

	def update
		@trip = Trip.find(params[:id])

		if @trip.update(trip_params)
			redirect_to edit_trip_path
		else
			render 'edit'
		end
	end

	private
		def trip_params
			params.require(:trip).permit(:author, :capacity, :cost, :description, :displayConfiguration, :endDate, :host, :image, :location, :public, :startDate, :title)
		end
end
