module V1
	class UsersController < ApplicationController
		def show
			if current_user
				render status: :ok
			else
				render json: {}, status: :unprocessable_entity
			end
		end

		def destroy
			if current_user
        		current_user.destroy
				render json: {}, status: :ok
			else
				render json: {}, status: :unprocessable_entity
			end
		end


		# #Da spostare in v1/me/buildings
		# def create_building
		# 	current_user.userbuildings.create(static_building_id: params["building_id"],level:1)
		# end
	end
end

