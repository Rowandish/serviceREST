# json.(current_user, :username, :email, :authentication_token)
json.general_infos do
	json.username current_user.username
	json.email current_user.email
	json.token current_user.authentication_token
end
if current_user.has_buildings?
	json.buildings current_user.userbuildings do |building|
		json.name = building.name
		json.level = building.level
		json.created_at = building.created_at
		json.rank = building.rank
		json.max_monster = building.max_monster
		json.max_level = building.max_level
		json.speed = building.speed
	end
end
