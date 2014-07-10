class CreateStaticBuildings < ActiveRecord::Migration
  def change
    rename_table :buildings, :static_buildings 
  end
end
