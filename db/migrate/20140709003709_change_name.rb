class ChangeName < ActiveRecord::Migration
  def change
  	rename_table :user_buildings, :userbuildings
  end
end
