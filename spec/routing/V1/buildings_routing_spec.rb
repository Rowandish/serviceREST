require "rails_helper"

RSpec.describe V1::BuildingsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/me/buildings").to route_to("v1/buildings#index", format: "json")
    end

    it "routes to #show" do
      expect(:get => "/v1/me/buildings/1").to route_to("v1/buildings#show", :id => "1", format: "json")
    end

    it "routes to #create" do
      expect(:post => "/v1/me/buildings").to route_to("v1/buildings#create", format: "json")
    end

    it "routes to #update" do
      expect(:put => "/v1/me/buildings/1").to route_to("v1/buildings#update", :id => "1", format: "json")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/me/buildings/1").to route_to("v1/buildings#destroy", :id => "1", format: "json")
    end

  end
end
