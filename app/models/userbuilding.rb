class Userbuilding  < ActiveRecord::Base
	belongs_to :user, :foreign_key => 'user_id'
	belongs_to :building, :foreign_key => 'building_id'
end
