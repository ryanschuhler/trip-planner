class ItemsController < ApplicationController
	before_action :authenticate_user!

	def create
		@trip = Trip.find(params[:trip_id])
		@item = @trip.items.create(item_params)
		redirect_to trip_path(@trip)
	end

	def destroy
		trip = Trip.find(params[:trip_id])
		@item = trip.items.find(params[:id])
		@item.destroy
		redirect_to trip_path(trip)
	end

	private
		def item_params
			params.require(:item).permit(:author, :categoryId, :required, :title)
		end
end
