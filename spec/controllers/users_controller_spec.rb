require 'rails_helper'

#I token qui vengono passati in maniera invisibile, all'atto pratico bisogna fare:
#curl -i -H "Accept: application/json" -H "Content-type: application/json" -H "X-User-Email: $EMAIL" -H "X-User-Token: $TOKEN"  -X GET $ROOT_URL/me.json
          

describe UsersController, :type => :controller do
  describe 'User' do
    describe (".show") do
      context ("when logged in") do
        before {sign_in_user}
        it ("should return valid response") do 
          get :show
          expect(response.status).to eq(200)
          user_info = JSON.parse(response.body)
          expect(user_info["authentication_token"]).to be_truthy
          expect(User.where(username: "user_logged").select("id").map(&:id)[0]).to eq(user_info["id"])
          #Voglio avere il numero secco dell'id di user logged, questo metodo fa funzionare le cose ma è obsceno
        end
      end
      context("when no user logged in") do
        before {sign_in_nobody}
        it ("should return error response") do
          get :show
          expect(response.status).to eq(422)
        end

      end

    end
  
  end
end

