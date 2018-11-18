class ApplicationController < ActionController::Base
    devise_group :user, contains: [:holder, :admin]

      def configure_permitted_parameters
        added_attrs = [:first_name, :last_name, :wallet]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        end
end
