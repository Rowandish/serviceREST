#Vedi https://github.com/ryanb/cancan
class Ability
  include CanCan::Ability
	
	#https://github.com/ryanb/cancan/wiki/defining-abilities
  def initialize(user)
  	#un utente può vedere tutti i gatti e crearne anche di nuovi
    can [:index, :create], Cat
    #per quanto riguarda i dettagli, l'aggiornamento e la rimozione di un gatto l'utente può farlo solo c on i fatti che possiede
    can [:show, :update, :destroy], Cat do |cat|
      cat.user == user
    end
  end
end
