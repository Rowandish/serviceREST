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
	end
end

