module V1
	class BuildingsController < ApplicationController
		before_action :get_user_buildings, only: [:index, :show, :create, :update, :destroy]
		before_action :get_static_building, only: [:create]
		
		
		def index
			render status: :ok
		end

    	def show
			@building = @buildings.find(params[:id])
			render status: :ok
    	end

    	def create
			
			if (diff = (current_user.user_info.money - @static_building.price)) >= 0 
				
				current_user.user_info.update_attributes!(money: diff)

				@building = @buildings.create(building_params)

				if @building.save!
				  render json: @building, status: :created
				else
				  render json: @building.errors, status: :unprocessable_entity
				end
			else
				render json: {}, status: :precondition_failed
			end

    	end

    	def destroy
			if @buildings.find(params[:id]).destroy!
				render json:{}, status: :ok
			else
				render json:{}, status: :unprocessable_entity
			end
    	end

    	private

			def get_user_buildings
				@buildings = current_user.buildings
			end

			def get_static_building
				@static_building = Building.find_by_static_building_id(params[:building][:static_building_id]).static_building
			end
	    	  
			def building_params
	    		params.require(:building).permit(:static_building_id, :map_index)
			end
	end
end

