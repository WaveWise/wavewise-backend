class Spot < ApplicationRecord
  has_one :condition

  def rating
    vote_value = SpotRating.where(spot_id: id).where(
      'created_at BETWEEN ? AND ?', 3.hours.ago, Time.now
    ).average(:rating)

    rating_percent = (vote_value + 1) * 50
    rating_percent
  end
end
