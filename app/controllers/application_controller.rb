class ApplicationController < ActionController::Base
 
 	protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
 	acts_as_token_authentication_handler_for User#, fallback_to_devise: false
 	before_filter :configure_permitted_parameters, if: :devise_controller?
	
	before_filter do
	  resource = controller_name.singularize.to_sym
	  method = "#{resource}_params"
	  params[resource] &&= send(method) if respond_to?(method, true)
	end

	protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :email, :password)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :email, :password)
    end
  end
end
