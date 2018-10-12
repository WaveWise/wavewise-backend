class Api::UserController < ApplicationController
  def update
    user_id = params[:user_id]
    @past_rating = ConditionRating.where(user: user_id).where(
      'created_at BETWEEN ? AND ?', 3.hours.ago, Time.now
    )
    if @past_rating.present?
      render json: :forbidden
    else
      render json: :ok
    end
  end

  private

  def user_params
    params.permit(:user_id)
  end
end
