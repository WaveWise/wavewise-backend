class Api::NewSpotController < ApplicationController
  def create
    @new_spot = NewSpot.new(new_spot_params)
  end

  private

  def new_spot_params
    params.require(:new_spot).permit(
      :user_name, :user, :email, :spot_name,
      :latitdue, :longitude, :swell_period_s,
      :swell_height_ft, :swell_direction,
      :wind_direction, :tide_type
    )
  end
end
