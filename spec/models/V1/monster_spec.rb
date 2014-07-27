require 'rails_helper'

RSpec.describe Monster, :type => :model do
   it "has a valid factory" do
		expect(create(:monster)).to be_valid
	end
	it "is invalid without a static_monster_id" do
		expect(build(:monster, static_monster_id: nil)).to_not be_valid
	end
	it "starts from level 1" do
		create(:monster)
		expect(Monster.last.level).to be(1)
	end
end
