class UsersController < ApplicationController
	def show
		if current_user.id.nil?
			render json: {}, status: :unprocessable_entity
		else
			render json: current_user, status: :ok
		end
	end
end

