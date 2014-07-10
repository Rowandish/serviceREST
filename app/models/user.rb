class User < ActiveRecord::Base
	acts_as_token_authenticatable
	devise :database_authenticatable, :registerable, :rememberable, :trackable
	
	validates :password, :username, length: { in: 6..20 }
	validates :username, :password, :email, presence: true
	validates :username, :email, uniqueness: true

	before_create :initialize_user
	
	has_many :buildings

	def has_buildings?
		self.buildings.nil?
	end

	private
	
	def initialize_user
		self.money = Settings.user.initial_money
		self.level = Settings.user.initial_level
	end
end
