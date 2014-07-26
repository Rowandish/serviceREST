class AddColToUser3 < ActiveRecord::Migration
  def change
  	add_column :static_buildings, :max_buildings, :integer
  end
end
