class AddLocationInfoToNewSpot < ActiveRecord::Migration[5.2]
  def change
    add_column :new_spots, :city, :string
    add_column :new_spots, :state, :string
    remove_column :new_spots, :latitude
    remove_column :new_spots, :longitude
  end
end
