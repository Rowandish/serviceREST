class AddColToUser < ActiveRecord::Migration
  def change
  	remove_column :users, :max_buildings
  end
end
