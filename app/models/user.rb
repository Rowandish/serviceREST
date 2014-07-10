class User < ActiveRecord::Base
	acts_as_token_authenticatable
	devise :database_authenticatable, :registerable, :rememberable, :trackable
	
	validates :password, :username, length: { in: 6..20 }
	validates :username, :password, :email, presence: true
	validates :username, :email, uniqueness: true

	before_create :initialize_money
	
	has_many :userbuildings
	# has_many :buildings, through: :userbuildings

	def has_buildings?
		self.buildings.nil?
	end

	protected
	
	def initialize_money
		self.money = Settings.user.initial_money
	end
end
