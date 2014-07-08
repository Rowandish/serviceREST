class UsersController < ApplicationController
	def show
		if current_user
			render json: current_user, status: :ok
		else
			render json: {}, status: :unprocessable_entity
		end
	end
end

