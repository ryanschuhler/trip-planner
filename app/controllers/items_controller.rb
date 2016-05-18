class ItemsController < ApplicationController
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
			params.require(:item).permit(:title)
		end
end
