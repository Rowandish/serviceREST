class SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
      if current_user
        render :json => {}, status: :unprocessable_entity
      else
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
        render :json => {
                      :user => current_user,
                      :authentication_token => current_user.authentication_token
                    }, status: :ok
      end
  end

  # DELETE /resource/sign_out
  def destroy
       if current_user
         # current_user.update authentication_token: nil
         # print current_user.inspect         
         current_user.update authentication_token: nil
         Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
         render :json => {}, status: :ok
       else
         render :json => {}, status: :unprocessable_entity
       end
  end
end
