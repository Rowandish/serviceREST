class Building < StaticModel::Base
	has_many :userbuildings
  	# has_many :users, through: :userbuildings
end
