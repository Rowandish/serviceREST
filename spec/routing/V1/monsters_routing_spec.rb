require "rails_helper"

RSpec.describe V1::MonstersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/v1/me/monsters").to route_to("v1/monsters#index", format: "json")
    end

    it "routes to #show" do
      expect(:get => "/v1/me/monsters/1").to route_to("v1/monsters#show", :id => "1", format: "json")
    end

    it "routes to #create" do
      expect(:post => "/v1/me/monsters").to route_to("v1/monsters#create", format: "json")
    end

    it "routes to #update" do
      expect(:put => "/v1/me/monsters/1").to route_to("v1/monsters#update", :id => "1", format: "json")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/me/monsters/1").to route_to("v1/monsters#destroy", :id => "1", format: "json")
    end

  end
end
