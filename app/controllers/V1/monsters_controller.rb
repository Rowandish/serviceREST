module V1
  class MonstersController < ApplicationController

    def index
      @monsters = Monster.all

      render json: @monsters
    end

    def show
      @monster = Monster.find(params[:id])

      render json: @monster
    end

    def create
      @monster = Monster.new(params[:monster])

      if @monster.save
        render json: @monster, status: :created, location: @monster
      else
        render json: @monster.errors, status: :unprocessable_entity
      end
    end

    def update
      @monster = Monster.find(params[:id])

      if @monster.update(params[:monster])
        head :no_content
      else
        render json: @monster.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @monster = Monster.find(params[:id])
      @monster.destroy

      head :no_content
    end
  end
end
