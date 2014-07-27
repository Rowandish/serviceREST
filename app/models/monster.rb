class Monster < ActiveRecord::Base
  belongs_to :user
  belongs_to :static_monster

  validates :static_monster_id, length: { in: 0..StaticMonster.all.length }
  validates :static_monster_id, presence: true

  before_create :initialize_monster

  private

  def initialize_monster
  	self.level = 1
  end
end
