class ApplicationController < ActionController::Base
    devise_group :user, contains: [:holder, :admin]
end
