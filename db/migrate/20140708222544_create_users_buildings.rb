class CreateUsersBuildings < ActiveRecord::Migration
  create_table 'users_buildings', :id => false do |t|
    t.column :building_id, :integer
    t.column :user_id, :integer
  end
end