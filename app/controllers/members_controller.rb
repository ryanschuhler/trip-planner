class MembersController < ApplicationController
  before_action :authenticate_user!

  def create
    @trip = Trip.find(params[:trip_id])
    @member = @trip.members.create(member_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    @member = trip.members.find(params[:id])
    @member.destroy
    redirect_to trip_path(trip)
  end

  def edit
    @member = Member.find(params[:id])
  end

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def show
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to @member
    else
      render 'edit'
    end
  end

  private
  def member_params
    params.require(:member).permit(:admin, :email, :inviter, :status, :user)
  end
end
