module V1
	class BuildingsController < ApplicationController
		before_action :get_user_buildings, only: [:index, :show, :create, :update, :destroy]
		
		
		def index
			render
		end

    	def show
			#show faccio vedere sia @building (il mio personale), che le informazini generiche legate al suo static building
			@building = @buildings.find(params[:id])
			render
    	end

    	def create
			#il building_id devo passarlo a mano, non tramite il path!
			print current_user.inspect
			@building = @buildings.create(building_params)

			if @building.save
			  render json: @building, status: :created
			else
			  render json: @building.errors, status: :unprocessable_entity
			end
    	end

    	def update
    	  # @tweet = Tweet.find(params[:id])

    	  # if @tweet.update(params[:tweet])
    	  #   head :no_content
    	  # else
    	  #   render json: @tweet.errors, status: :unprocessable_entity
    	  # end
    	end

    	def destroy
			@buildings.find(params[:id]).destroy
			head :no_content
    	end

    	private

			def get_user_buildings
				@buildings = current_user.buildings
			end
	    	  
			def building_params
	    		params.require(:building).permit(:static_building_id, :map_index)
			end
		

	end
end

