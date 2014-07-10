class AddColToUserBuilding < ActiveRecord::Migration
  def change
    add_column :userbuildings, :map_index, :integer
  end
end
