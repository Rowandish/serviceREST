include Devise::TestHelpers

def sign_in_nobody
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in User.new
end

def sign_in_user
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in create(:user, :username => "user_logged")
end