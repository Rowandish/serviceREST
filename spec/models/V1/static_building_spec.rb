require 'rails_helper'

RSpec.describe StaticBuilding, :type => :model do
	context("at the beginning of the app") do
		it "load every element" do
			expect(StaticBuilding.count).to eq(YAML.load_file(Rails.root.join("config","data","static_buildings.yml")).count)
		end
	end
end
