require 'rails_helper'

#I seguenti test sono migliorabili ma sembra che agiscano in maniera anarchica...
describe SessionsController, type: :controller do

  describe 'Session' do
    describe (".create") do
      context (" ,when user is logged in, ") do
        before {sign_in_user}
        it ("return error response") do 
          get :create
          expect(response).to have_http_status(422)
        end
      end

      context(",when no users is logged in, ") do
        before {sign_out_user}
        it ("user is correctly logged in") do
          # post :create, {user:{email: "user_logged_test", password: "my_password"}}
          # "non riesco a far loggare l'utente stile curl con rspec"
        end
      end
    end

    describe (".destroy") do
      context(",when user is logged in, ") do
        before {sign_in_user}
        it ("user is correctly logged out") do
          get :destroy
          expect(response).to have_http_status(200)
        end
      end
    end
  
  end
end

