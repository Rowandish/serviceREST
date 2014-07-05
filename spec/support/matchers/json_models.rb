RSpec::Matchers.define :match_model do |my_model|
	match do |json_val|
		json_val == JSON.parse(my_model.to_json)
	end

	failure_message do |json_val|
		"#{json_val.class} not matching your model --- #{json_val.inspect}"
	end
	failure_message_when_negated do |json_val|
		"#{json_val.class} is matching your model --- #{json_val.inspect}"
	end

end