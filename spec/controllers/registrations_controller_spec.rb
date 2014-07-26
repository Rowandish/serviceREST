require 'rails_helper'

describe RegistrationsController, type: :controller do
  describe 'User' do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end
    
    describe (".create") do
      context("when parameters are correct, ") do
        it ("should create a correct user") do
          post :create, {user:{email: "mail@mail.com", password: "password", username: "ok_username"}}
          expect(response).to have_http_status 201 
          expect(json["token"]).to be_truthy
          expect(User.last.username).to eq("ok_username")
          expect(User.last.user_info.money).to eq(Settings.user.initial_money)
          expect(User.last.user_info.level).to eq(Settings.user.initial_level)
          expect(User.last.user_info.max_buildings).to eq(Settings.user.initial_max_buildings)
        end
      end

      context("when parameters are not correct, ") do
        it ("should respond with an error when mail or username is duplicate") do
          create(:user, email: "duplicate_mail@mail.com", username: "duplicate_username")
          post :create, {user:{email: "duplicate_mail@mail.com", password: "password", username: "ok_username"}}
          expect(response).to have_http_status 422
          post :create, {user:{email: "mail@mail.com", password: "password", username: "duplicate_username"}}
          expect(response).to have_http_status 422
        end

        it ("should respond with an error when username is nil ot too short") do
          post :create, {user:{email: "mail@mail.com", password: "password", username: nil}}
          expect(response).to have_http_status 422
          post :create, {user:{email: "mail@mail.com", password: "password", username: "short"}}
          expect(response).to have_http_status 422
        end
      end
    end
  end
end


 