require 'rails_helper'

describe V1::BuildingsController, type: :controller do
  render_views

  describe 'Building' do

    let! (:user) do
      create(:user_with_buildings,username:"user_buildings")
    end

    context ("when user is logged in") do
      before {sign_in_user user}
      
      describe (".create") do
        it ("should correctly create a building") do 
          post :create, {building:{static_building_id: "2", map_index: "2"}}
          expect(response.status).to eq(201)
          user_info = JSON.parse(response.body)
          expect(Building.last.map_index).to eq(user_info["map_index"])
          expect(User.find_by_username("user_buildings").buildings.last.map_index).to eq(user_info["map_index"])
        end
      end

      describe (".index") do
        it ("should return all buildings of current user") do 
          get :index
          expect(response.status).to eq(200)
          user_info = JSON.parse(response.body)
          print user_info.inspect
        end
      end


    
    end
  end
end

