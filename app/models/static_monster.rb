class StaticMonster < ActiveRecord::Base
	before_validation :readonly!
end
