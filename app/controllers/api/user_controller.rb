class Api::UserController < ApplicationController
  def update
    user_id = params[:user_id]
    @past_rating = ConditionRating.where(user: user_id).where(
      'created_at BETWEEN ? AND ?', 1.hour.ago, Time.now
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
