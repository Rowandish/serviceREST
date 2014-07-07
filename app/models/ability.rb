#Vedi https://github.com/ryanb/cancan
class Ability
  include CanCan::Ability
	
	#https://github.com/ryanb/cancan/wiki/defining-abilities
  def initialize(user)
    can [:index, :create], Cat
    can [:show, :update, :destroy], Cat do |cat|
      cat.user == user
    end
  end
end