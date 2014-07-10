FactoryGirl.define do
  factory :building do
  	sequence(:map_index)  { |n| "#{n}" }
  	static_building_id { 1 + rand(5) }
  	user
  end
end
