module V1
	class BuildingsController < ApplicationController
		before_action :get_user_buildings, only: [:index, :show, :create, :update, :destroy]
		before_action :get_static_building, only: [:create]
		before_action :update_finished_date, only: [:index, :show]
		
		
		def index
		end

    	def show
			@building = @buildings.find(params[:id])
    	end

    	def create
			if @buildings.length < current_user.user_info.max_buildings
				if (diff = (current_user.user_info.money - @static_building.price)) >= 0 
					
					current_user.user_info.update_attributes!(money: diff)

					@building = @buildings.create(building_params)
					@building.update_attributes!(finished_at: calc_finished_date)

					if @building.save!
					  render json: @building, status: :created
					else
					  render json: @building.errors, status: :unprocessable_entity
					end
				else
					render json: {error: "not enough money"}, status: :precondition_failed
				end
			else
				render json: {error: "max buildings limit reached"}, status: :precondition_failed
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

			# funzione attualmente a caso, da valutare in seguito l'algoritmo migliore
			def calc_finished_date
				speed = @static_building.speed
				level = current_user.user_info.level
				Time.now + speed.days - level.hours
			end

			def update_finished_date
				current_user.buildings.where("buildings.finished_at < ?", Time.now).update_all(finished_at: nil)
			end
				
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

