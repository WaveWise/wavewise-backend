class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.references :spot, foreign_key: true
      t.decimal :swell_period_s
      t.decimal :swell_height_ft
      t.string :swell_direction
      t.decimal :wind_speed_mph
      t.string :wind_direction
      t.string :tide

      t.timestamps
    end
  end
end
