require 'rails_helper'

RSpec.describe Building, :type => :model do
	it "has a valid factory" do
		expect(create(:building)).to be_valid
	end
	it "is invalid without a static_building_id" do
		expect(build(:building, static_building_id: nil)).to_not be_valid
	end
	it "starts from level 1" do
		create(:building)
		expect(Building.last.level).to be(1)
	end
end
