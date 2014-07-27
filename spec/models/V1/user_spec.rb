require 'rails_helper'

RSpec.describe User, :type => :model do
	it "has a valid factory" do
		expect(create(:user)).to be_valid
	end
	it "is invalid without a firstname" do
		expect(build(:user, username: nil)).to_not be_valid
	end
	it "does not allow duplicate username" do
		create(:user, username: "duplicate_username")
		expect(build(:user,username:"duplicate_username")).to_not be_valid
	end
end


