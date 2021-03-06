class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    
  helper_method :friend_request_count
      
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up , keys: [:username ,:age,:gender,:bio])
   devise_parameter_sanitizer.permit(:sign_in , keys: [:username ])
   devise_parameter_sanitizer.permit(:account_update, keys: [:username ,:age,:gender,:bio])
  end
  
  def friend_request_count
      current_user.pending_request_from.map(&:user).size
  end      
end
