class SpotRating < ApplicationRecord
  belongs_to :spot

  def create
    @spot_rating = SpotRating.new(spot_rating_params)
  end

  private

  def spot_rating_params
    params.permit(:spot_id, :user, :rating)
  end
end
