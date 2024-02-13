#require_dependency 'password'

class ApplicationController < ActionController::Base

  config.filter_parameters :password
  protect_from_forgery

  
end
