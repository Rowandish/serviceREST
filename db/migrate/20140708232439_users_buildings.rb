class UsersBuildings < ActiveRecord::Migration
  def change
  	create_table 'user_buildings', id: false do |t|
  		t.belongs_to :user
  		t.belongs_to :building
  	end
  end
end