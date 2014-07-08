require 'rails_helper'

describe SessionsController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'Session' do
    describe (".create") do
      context ("when user logged in") do
        before {sign_in_user}
        it ("return error response") do 
          get :create
          expect(response.status).to eq(422)
        end
      end
      context("when no users logged in") do
        before {sign_in_nobody} 
        it ("login correctly the user") do
          get :create
          print response.body
          expect(response.status).to eq(200)

        end

      end

    end
  
  end
end

