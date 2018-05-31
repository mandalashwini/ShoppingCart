class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname,:mobile_number ])
  end

  def after_sign_in_path_for(resource)
      if current_user.role.eql?("user")      
          stored_location_for(resource) || super

      elsif current_user.role.eql?("admin")
           admindashboard_path
      end
  end
   def after_sign_out_path_for(resource_or_scope)
         Cart.destroy_all
         #redirect_to :back
         stored_location_for(resource_or_scope) || super

  end

  private
  def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      # :user is the scope we are authenticating
      store_location_for(:user, request.referer)
    end
end
