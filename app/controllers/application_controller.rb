class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # protect_from_forgery with: :exception
  include SessionHelper
  # layout "#{@current_user.present? && @current_user.role == 'admin' ? 'admin' : 'application'}"

end
