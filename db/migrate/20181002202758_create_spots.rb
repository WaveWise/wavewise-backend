class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :code
      t.string :coordinates
      t.string :shore_angle

      t.timestamps
    end
  end
end
