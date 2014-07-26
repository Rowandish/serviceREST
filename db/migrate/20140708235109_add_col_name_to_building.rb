class AddColNameToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :name, :string
    add_column :buildings, :rank, :integer
  end
end
