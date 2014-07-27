class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.integer :level
      t.integer :power
      t.integer :agility
      t.integer :mind
      t.integer :charisma
      t.integer :joy
      t.references :user, index: true
      t.references :static_monster, index: true

      t.timestamps
    end
  end
end
