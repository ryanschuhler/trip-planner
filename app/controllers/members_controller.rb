class MembersController < ApplicationController
  before_action :authenticate_user!

  def create
    @trip = Trip.find(params[:trip_id])
    @member = @trip.members.create(member_params)
    @member.inviter_id = current_user.id
    @member.update(member_params)

    redirect_to trip_members_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @member = @trip.members.find(params[:id])

    @member.destroy

    redirect_to trip_members_path(@trip)
  end

  def index
    @trip = Trip.find(params[:trip_id])

    @members = @trip.members.all
    @members_yes = @trip.members.where(status: 1)
    @members_no = @trip.members.where(status: 2)
    @members_maybe = @trip.members.where(status: 3)
    @members_waiting = @trip.members.where(status: nil)

    @user = current_user
  end

  def respond
    @trip = Trip.find(params[:trip_id])
    @member = @trip.members.find(params[:id])
    @user = current_user
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @member = @trip.members.find(params[:id])
    @member.user_id = current_user.id

    if @member.update(member_params)
      redirect_to trip_members_path(@trip)
    else
      render 'respond'
    end

  end

  private
  def member_params
    params.require(:member).permit(:admin, :email, :inviter, :status, :user)
  end
end
