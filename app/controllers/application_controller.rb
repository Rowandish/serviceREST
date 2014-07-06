include ActionController::MimeResponds
include ActionController::StrongParameters

# class ApplicationController < ActionController::API
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
	acts_as_token_authentication_handler_for User#, fallback_to_devise: false
	
  # Security note: controllers with no-CSRF protection must disable the Devise fallback,
  # see #49 for details.
  # acts_as_token_authentication_handler_for User, fallback_to_devise: false

  # The token authentication requirement can target specific controller actions:
  # acts_as_token_authentication_handler_for User, only: [:create, :update, :destroy]
  # acts_as_token_authentication_handler_for User, except: [:index, :show]

  # Several token authenticatable models can be handled by the same controller.
  # If so, for all of them except the last, the fallback_to_devise should be disabled.
  #
  # Please do notice that the order of declaration defines the order of precedence.
  #
  # acts_as_token_authentication_handler_for Admin, fallback_to_devise: false
  # acts_as_token_authentication_handler_for SpecialUser, fallback_to_devise: false
  # acts_as_token_authentication_handler_for User # the last fallback is up to you

  
  # Apply strong_parameters filtering before CanCan authorization
  # See https://github.com/ryanb/cancan/issues/571#issuecomment-10753675
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  rescue_from CanCan::AccessDenied do |exception|  
    respond_to do |format|  
      format.json { render :json=> exception.to_json, :status => :forbidden }  
    end   
  end

end
