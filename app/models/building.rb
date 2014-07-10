class Building  < ActiveRecord::Base
	belongs_to :user, foreign_key: 'user_id'
	belongs_to :static_building, foreign_key: 'building_id'

	before_create :initialize_building

	def initialize_building
		self.level = 1
	end

end
