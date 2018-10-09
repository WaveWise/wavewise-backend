class ConditionRating < ApplicationRecord
  belongs_to :spot

  def create
    @condition_rating = ConditionRating.new(condition_rating_params)
  end

  private

  def condition_rating_params
    params.permit(
      :spot_id,
      :user,
      :rating,
      :condition_swell_period_s,
      :condition_swell_height_ft,
      :condition_swell_direction,
      :condition_wind_speed_mph,
      :condition_wind_direction,
      :condition_tide_type,
      :condition_tide_time
    )
  end
end
