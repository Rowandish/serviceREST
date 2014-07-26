FactoryGirl.define do
  factory :building do
  	sequence(:map_index)  { |n| "#{n}" }
  	static_building_id 1
  	finished_at Time.now + 1.hour
  	user
  end
end
