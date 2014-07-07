require 'rails_helper'

describe UsersController, :type => :controller do
  describe 'User' do

    before(:each) do
      # @request.env["devise.mapping"] = Devise.mappings[:user]
      # user = create(:user)
      # sign_in user
      # login_user
    end
    
    describe (".show") do
      it ("return error if user not logged or invalid") do
        sign_in nil
        get :show, {}, format: :json
        # print response.inspect
      end
    end
  
  end
end
 