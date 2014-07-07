class User < ActiveRecord::Base
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable

  validates :password, :username, length: { in: 6..20 }
  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true

end
