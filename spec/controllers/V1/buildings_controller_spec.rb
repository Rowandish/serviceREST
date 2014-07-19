require 'rails_helper'

describe V1::BuildingsController, type: :controller do
  render_views

  describe 'Building' do

    let! (:user) do
      create(:user_with_buildings,username:"user.buildings")
    end

    context ("when user is logged in") do
      before (:each) do
        sign_in_user user
        allow_any_instance_of(StaticBuilding).to receive(:price).and_return(1000)
      end
      
      describe (".create") do
        context("when user has enough money, ") do
          context("when user has enough space to build, ") do
            it ("should correctly create a building") do 

              user.user_info.update_attributes!(money: 1500)
              user.user_info.update_attributes!(max_buildings: 10)
              
              expect {
                post :create, {building:{static_building_id: "1", map_index: "2"}}
              }.to change(Building,:count).by(1)
              
              expect(response).to have_http_status 201
              expect(Building.last.map_index).to eq(json["map_index"])
              expect(user.buildings.last.map_index).to eq(json["map_index"])
              expect(User.find_by_username("user.buildings").user_info.money).to eq 500
            end
          end
          context("when user has not enough space to build") do 
            it ("should respond with an error") do 
              expect {
                post :create, {building:{static_building_id: "1", map_index: "2"}}
              }.to_not change(Building,:count)
              
              expect(response).to have_http_status 412
            end
          end
        end
      
        context("when user doedn't have enough money, ") do
            it ("should respond with an error") do 
              User.find_by_username("user.buildings").user_info.update_attributes!(money: 500)

              expect {
                post :create, {building:{static_building_id: "1", map_index: "2"}}
              }.to_not change(Building,:count)
              
              expect(response).to have_http_status 412
            end
          end

      describe (".index") do
        it ("should return all buildings belonged by current user") do 
          get :index
          expect(response).to be_success
          expect(user.buildings.length).to eq(json["buildings"].length)
        end
      end

      describe (".show") do
        it ("should return a particular building") do 
          get :show, id:user.buildings.first.id
          expect(response).to be_success
          expect(user.buildings.first.level).to eq(json["level"])
        end
      end

      describe (".destroy") do
        it ("should delete a building") do
          expect{
            delete :destroy, id:user.buildings.last.id
          }.to change(Building,:count).by(-1)
        end
      end

    end
    
    end
  end
end

