class RemoveCol < ActiveRecord::Migration
  def change
  	remove_column :users, :money, :level
  end
end
