class CreateUserBuildingTable < ActiveRecord::Migration
  def change
  	create_table 'userbuildings' do |t|
  		t.belongs_to :user
  		t.belongs_to :building
  		t.integer :level
  		t.datetime :time_creation
  		t.timestamps
  	end
  end
end
