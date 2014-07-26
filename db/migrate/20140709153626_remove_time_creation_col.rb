class RemoveTimeCreationCol < ActiveRecord::Migration
  def change
  	remove_column :userbuildings, :time_creation
  end
end
