class ConditionRating < ApplicationRecord
  belongs_to :spot
  validates :user, presence: true
  validates :rating, presence: true
end
