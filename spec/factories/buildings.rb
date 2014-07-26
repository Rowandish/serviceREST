FactoryGirl.define do
  factory :building do
  	sequence(:map_index)  { |n| "#{n}" }
  	static_building_id 1
  	finished_at do
	    from = Time.now - 10.hours
	    to   = Time.now + 10.hours
	    Time.at(from + rand * (to - from))
  	end
  	user
  end
end
