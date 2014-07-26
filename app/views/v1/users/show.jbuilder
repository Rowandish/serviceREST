# json.(current_user, :username, :email, :authentication_token)
json.general_infos do
	json.username current_user.username
	json.email current_user.email
	json.token current_user.authentication_token
end
json.user_info do
	json.level = current_user.user_info.level
	json.money = current_user.user_info.money
	json.max_buildings = current_user.user_info.max_buildings
end

if current_user.buildings
	json.buildings current_user.buildings {|building| json.partial! building}
end
