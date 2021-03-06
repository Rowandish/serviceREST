def sign_in_nobody
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in User.new
end

def sign_in_user(user = create(:user, username: "user_logged", password: "my_long_password"))
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in user
end

def sign_out_user
	sign_in_user
	allow(controller).to receive(:current_user).and_return(nil)
end