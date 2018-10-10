class Api::SpotRatingController < ApplicationController
  def create
    @spot_rating = SpotRating.new(spot_rating_params)
    user_check
  end

  private

  def user_check
    @user_id = @spot_rating.user
    @past_rating = SpotRating.where(user: @user_id).where(
      'created_at BETWEEN ? AND ?', 3.hours.ago, Time.now
    )
    if @past_rating.present?
      render json: :forbidden
    else
      @spot_rating.save
      render json: @spot_rating
    end
  end

  def spot_rating_params
    params.require(:spot_rating).permit(:spot_id, :user, :rating)
  end
end
