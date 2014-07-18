# Classe utente
class User < ActiveRecord::Base
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable, :rememberable, :trackable

  validates :password, :username, length: { in: 6..20 }
  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true

  before_create :initialize_user
  has_many :buildings
  has_one :user_info

  private

  def initialize_user
    print "----------------"
    self.create_user_info!(money:Settings.user.initial_money,level:Settings.user.initial_level)
  end
end
