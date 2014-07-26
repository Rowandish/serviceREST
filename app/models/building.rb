#Building model class
class Building  < ActiveRecord::Base
	belongs_to :user
	belongs_to :static_building

	validates :map_index, length: { in: 0..Settings.buildings.max_map_index}
	validates :static_building_id, length: { in: 0..StaticBuilding.all.length }
	validates :map_index, :static_building_id, presence: true

	before_create :initialize_building

	private

	def initialize_building
		self.level = 1
	end

end
