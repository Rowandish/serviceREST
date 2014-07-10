class Building  < ActiveRecord::Base
	belongs_to :user
	belongs_to :static_building

	before_create :initialize_building

	def initialize_building
		self.level = 1
	end

end
