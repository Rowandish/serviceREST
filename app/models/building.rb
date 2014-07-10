class Building  < ActiveRecord::Base
	belongs_to :user, :foreign_key => 'user_id'
	belongs_to :static_building, :foreign_key => 'building_id'
end
