class AddNumMaxMonsterToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :monster_max, :integer
  end
end
