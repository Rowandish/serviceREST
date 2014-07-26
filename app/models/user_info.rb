class UserInfo < ActiveRecord::Base
	 validates :money, length: { in: 0..Settings.user.max_money }
	 validates :level, length: { in: 0..Settings.user.max_level }
	 validates :max_buildings, length: { in: 0..Settings.user.max_buildings }
end

