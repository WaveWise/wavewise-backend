class DropTideFromConditions < ActiveRecord::Migration[5.2]
  def change
    remove_column :conditions, :tide
    add_column :conditions, :tide_type, :string
    add_column :conditions, :tide_time, :string
  end
end
