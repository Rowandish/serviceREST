require 'rails_helper'

describe SessionsController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    create(:user, username: "user_logged", password: "my_pasword")
  end

  describe 'Session' do
    
    describe (".create") do
      context (" ,when user is logged in, ") do
        before {sign_in_user}
        it ("return error response") do 
          get :create
          expect(response.status).to eq(422)
        end
      end

      context(",when no users is logged in, ") do
        before {sign_out :user}
        it ("login correctly the user") do
          #anche quì ho l'incubo del warden!!
          get :create, {username: "user_logged", password: "my_pasword"}
          expect(response.status).to eq(200)
          print response.body.inspect
          user_info = JSON.parse(response.body)
          expect(user_info["authentication_token"]).to be_truthy
        end
      end

    end

    # describe (".destroy") do
    #   context("when user is logged in") do
    #     before {sign_in_user}
    #     it ("correctly log out the user") do
    #       # subject(:logged_user) {User.find_by_username("user_logged")}

    #       expect(User.find_by_username("user_logged").authentication_token).to be_truthy
    #       get :destroy
    #       expect(response.status).to eq(200)
    #       expect(User.find_by_username("user_logged").authentication_token).to be_nil
    #     end
    #   end
    # end
  
  end
end

