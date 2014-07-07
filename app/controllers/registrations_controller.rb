class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create(user_params)
    if @user.save
      render :json => @user, status: :created
    else
      render :json => @user.errors, status: :unprocessable_entity
    end

  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end