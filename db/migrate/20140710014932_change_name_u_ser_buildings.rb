class ChangeNameUSerBuildings < ActiveRecord::Migration
  def change
    rename_table :userbuildings, :buildings 
  end
end
