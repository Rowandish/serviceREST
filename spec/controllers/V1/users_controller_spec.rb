require 'rails_helper'

#I token qui vengono passati in maniera invisibile, all'atto pratico bisogna fare:
#curl -i -H "Accept: application/json" -H "Content-type: application/json" -H "X-User-Email: $EMAIL" -H "X-User-Token: $TOKEN"  -X GET $ROOT_URL/me.json
          

describe V1::UsersController, type: :controller do
  render_views

  let! (:user) do
      create(:user_with_buildings, username:"my_username")
    end

  describe 'User' do
    describe (".show") do
      context ("when logged in") do
        before {sign_in_user user}
        it ("should return valid response") do 
          get :show
          expect(response).to be_success
          expect(json["general_infos"]["token"]).to be_truthy
          expect(User.find_by_username("my_username").email).to eq(json["general_infos"]["email"])
        end
      end
      context("when no user logged in") do
        before { sign_out_user }
        it ("should return error response") do
          get :show
          expect(response).to have_http_status 422
        end

      end

    end
  
  end
end

