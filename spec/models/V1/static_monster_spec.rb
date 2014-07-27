require 'rails_helper'

RSpec.describe StaticMonster, :type => :model do
	context("at the beginning of the app") do
		it "load every element" do
			expect(StaticMonster.count).to eq(YAML.load_file(Rails.root.join("config","data","static_monsters.yml")).count)
		end
	end
end
