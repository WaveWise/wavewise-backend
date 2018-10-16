class Api::NewSpotsController < ApplicationController
  def create
    @new_spot = NewSpot.new(new_spot_params)
    @new_spot.save
    @email = params[:new_spot][:email]
    @name = params[:new_spot][:user_name]
    @spot = params[:new_spot][:spot_name]
    NewSpotMailer.confirmation_mailer(@email, @name, @spot).deliver_now
    render json: @new_spot
  end

  private

  def new_spot_params
    params.require(:new_spot).permit(
      :user_name, :user, :email, :spot_name,
      :swell_period_s,
      :swell_height_ft, :swell_direction,
      :wind_direction, :tide_type,
      :city, :state
    ).
  end
end
