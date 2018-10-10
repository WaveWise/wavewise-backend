class CreateConditionRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :condition_ratings do |t|
      t.references :spot, foreign_key: true
      t.uuid :user
      t.integer :rating
      t.string :condition_swell_period_s
      t.string :condition_swell_height_ft
      t.string :condition_swell_direction
      t.string :condition_wind_speed_mph
      t.string :condition_wind_direction
      t.string :condition_tide_type
      t.string :condition_tide_time

      t.timestamps
    end
  end
end
