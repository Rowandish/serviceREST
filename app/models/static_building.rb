class StaticBuilding < ActiveRecord::Base
	before_validation :readonly!
end
