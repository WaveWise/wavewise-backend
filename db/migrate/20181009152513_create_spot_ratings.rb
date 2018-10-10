class CreateSpotRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :spot_ratings do |t|
      t.references :spot, foreign_key: true
      t.uuid :user
      t.integer :rating

      t.timestamps
    end
  end
end
