class AddcoltoStaticBuilding < ActiveRecord::Migration
  def change
  	add_column :static_buildings, :max_monsters, :integer
  end
end
