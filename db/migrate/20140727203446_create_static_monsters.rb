class CreateStaticMonsters < ActiveRecord::Migration
  def change
    create_table :static_monsters do |t|

      t.timestamps
    end
  end
end
