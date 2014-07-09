module V1
	class UserBuildingsController < ApplicationController
		# before_action :get_static_building, only: [:show, :update, :destroy]
		# def get_static_building
		# 	@building = StaticBuilding.find(params[:id])
		# end
		

		#Appunti:
		#Creazione di un nuovo UserBuilding: @user = User.last
		#@user.userbuildings.create(level:1, building_id:3)
		#notare che devo sempre specificare il building_id a cui mi sto riferendo!
		#Breve: User.last.userbuildings.create(level:1,building_id:3)
		

	end
end

