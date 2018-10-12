class Api::NewSpotsController < ApplicationController
  def create
    @new_spot = NewSpot.new(new_spot_params)
    @new_spot.save
    render json: @new_spot
  end

  private

  def new_spot_params
    params.require(:new_spot).permit(
      :user_name, :user, :email, :spot_name,
      :swell_period_s,
      :swell_height_ft, :swell_direction,
      :wind_direction, :tide_type
    ).merge(location_params)
    end

  def location_params
    params.require(:new_spot).require(:location).permit(:latitude, :longitude)
  end
end
