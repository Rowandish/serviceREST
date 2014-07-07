class UsersController < ApplicationController
	def show
		render json: current_user.username
	end
end

