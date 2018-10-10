class Spot < ApplicationRecord
  has_one :condition

  def self.rating(id)
    @rating_percent = 0
    @vote_value = ConditionRating.where(spot_id: id).where(
      'created_at BETWEEN ? AND ?', 3.hours.ago, Time.now
    ).average(:rating)
    return @rating_percent if @vote_value.blank?
    
    @rating_percent = (@vote_value + 1) * 50
    @rating_percent.round(1)
  end
end
