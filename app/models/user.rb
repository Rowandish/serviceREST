class User < ActiveRecord::Base
	acts_as_token_authenticatable
	devise :database_authenticatable, :registerable, :rememberable, :trackable
	
	validates :password, :username, length: { in: 6..20 }
	validates :username, :password, :email, presence: true
	validates :username, :email, uniqueness: true
	
	has_many :userbuildings
	# has_many :buildings, through: :userbuildings

	def has_buildings?
		self.buildings.nil?
	end
end
