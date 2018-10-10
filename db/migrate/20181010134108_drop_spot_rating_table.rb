class DropSpotRatingTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :spot_ratings
  end
end
