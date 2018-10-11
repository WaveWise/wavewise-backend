class Api::ConditionRatingController < ApplicationController
  def create
    @condition_rating = ConditionRating.new(condition_rating_params)
    user_check
  end

  private

  def user_check
    @user_id = @condition_rating.user
    @past_rating = ConditionRating.where(user: @user_id).where(
      'created_at BETWEEN ? AND ?', 3.hours.ago, Time.now
    )
    if @past_rating.present? || @condition_rating.user.blank? || @condition_rating.rating.blank?
      render json: :forbidden
    else
      @condition_rating.save
      render json: @condition_rating
    end
  end

  def condition_rating_params
    params.require(:condition_rating).permit(
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
