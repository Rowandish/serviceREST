class AddCol4 < ActiveRecord::Migration
  def change
  	add_column :user_infos, :max_buildings, :integer
  end
end
