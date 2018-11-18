class ApplicationController < ActionController::Base
    devise_group :user, contains: [:holder, :admin]
    before_action :configure_permitted_parameters, if: :devise_controller?


      def configure_permitted_parameters
        added_attrs = [:first_name, :last_name, :wallet, :balance]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        end
end
