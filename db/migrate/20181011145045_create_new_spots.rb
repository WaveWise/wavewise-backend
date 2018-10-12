class CreateNewSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :new_spots do |t|
      t.string :user_name
      t.uuid :user
      t.string :email
      t.string :spot_name
      t.string :latitude
      t.string :longitude
      t.string :swell_period_s
      t.string :swell_height_ft
      t.string :swell_direction
      t.string :wind_direction
      t.string :tide_type

      t.timestamps
    end
  end
end
