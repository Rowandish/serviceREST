class ChangeColNameBuildings < ActiveRecord::Migration
  def change
  	rename_column :buildings, :building_id, :static_building_id
  end
end
