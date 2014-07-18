class AddColPricetoStaticBuilding < ActiveRecord::Migration
  def change
  	add_column :static_buildings, :price, :integer
  end
end
