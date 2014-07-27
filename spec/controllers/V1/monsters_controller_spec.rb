require 'rails_helper'

RSpec.describe MonstersController, :type => :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all monsters as @monsters" do
      monster = Monster.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:monsters)).to eq([monster])
    end
  end

  describe "GET show" do
    it "assigns the requested monster as @monster" do
      monster = Monster.create! valid_attributes
      get :show, {:id => monster.to_param}, valid_session
      expect(assigns(:monster)).to eq(monster)
    end
  end

  describe "GET new" do
    it "assigns a new monster as @monster" do
      get :new, {}, valid_session
      expect(assigns(:monster)).to be_a_new(Monster)
    end
  end

  describe "GET edit" do
    it "assigns the requested monster as @monster" do
      monster = Monster.create! valid_attributes
      get :edit, {:id => monster.to_param}, valid_session
      expect(assigns(:monster)).to eq(monster)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Monster" do
        expect {
          post :create, {:monster => valid_attributes}, valid_session
        }.to change(Monster, :count).by(1)
      end

      it "assigns a newly created monster as @monster" do
        post :create, {:monster => valid_attributes}, valid_session
        expect(assigns(:monster)).to be_a(Monster)
        expect(assigns(:monster)).to be_persisted
      end

      it "redirects to the created monster" do
        post :create, {:monster => valid_attributes}, valid_session
        expect(response).to redirect_to(Monster.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved monster as @monster" do
        post :create, {:monster => invalid_attributes}, valid_session
        expect(assigns(:monster)).to be_a_new(Monster)
      end

      it "re-renders the 'new' template" do
        post :create, {:monster => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested monster" do
        monster = Monster.create! valid_attributes
        put :update, {:id => monster.to_param, :monster => new_attributes}, valid_session
        monster.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested monster as @monster" do
        monster = Monster.create! valid_attributes
        put :update, {:id => monster.to_param, :monster => valid_attributes}, valid_session
        expect(assigns(:monster)).to eq(monster)
      end

      it "redirects to the monster" do
        monster = Monster.create! valid_attributes
        put :update, {:id => monster.to_param, :monster => valid_attributes}, valid_session
        expect(response).to redirect_to(monster)
      end
    end

    describe "with invalid params" do
      it "assigns the monster as @monster" do
        monster = Monster.create! valid_attributes
        put :update, {:id => monster.to_param, :monster => invalid_attributes}, valid_session
        expect(assigns(:monster)).to eq(monster)
      end

      it "re-renders the 'edit' template" do
        monster = Monster.create! valid_attributes
        put :update, {:id => monster.to_param, :monster => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested monster" do
      monster = Monster.create! valid_attributes
      expect {
        delete :destroy, {:id => monster.to_param}, valid_session
      }.to change(Monster, :count).by(-1)
    end

    it "redirects to the monsters list" do
      monster = Monster.create! valid_attributes
      delete :destroy, {:id => monster.to_param}, valid_session
      expect(response).to redirect_to(monsters_url)
    end
  end

end
