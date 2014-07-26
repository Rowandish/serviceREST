class AddColToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :speed, :integer
    add_column :buildings, :max_level, :integer
  end
end
