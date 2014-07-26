class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.belongs_to :user
      t.integer :money
      t.integer :level
      t.timestamps
    end
  end
end
