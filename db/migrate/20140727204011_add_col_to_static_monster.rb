class AddColToStaticMonster < ActiveRecord::Migration
  def change
  	add_column :static_monsters, :name, :string
  	add_column :static_monsters, :rank, :integer
  	add_column :static_monsters, :max_level, :integer
  	add_column :static_monsters, :price, :integer
  	add_column :static_monsters, :base_power, :integer
  	add_column :static_monsters, :base_agility, :integer
  	add_column :static_monsters, :base_mind, :integer
  	add_column :static_monsters, :base_charisma, :integer
  	add_column :static_monsters, :base_joy, :integer
  end
end
