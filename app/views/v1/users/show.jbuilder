# json.(current_user, :username, :email, :authentication_token)
json.general_infos do
	json.username current_user.username
	json.email current_user.email
	json.token current_user.authentication_token
end
