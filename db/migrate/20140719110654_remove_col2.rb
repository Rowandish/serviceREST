class RemoveCol2 < ActiveRecord::Migration
  def change
  	remove_column :static_buildings, :max_buildings
  end
end
