class RegistrationsController < Devise::RegistrationsController
	layout 'home_layout'
    protected
    def after_sign_up_path_for(resource)
        puts current_user.role
    end
end