class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  protected

 
  def current_guestaccount
    # Return nil if the session value isn't set, don't query the DB
    return nil unless session[:guestaccount_id]
    # @x ||= y
    # will make y run only once if it returns a successful value,
    # essentially caching it for the entire request
    @current_guestaccount ||= Guestaccount.find(session[:guestaccount_id])
  end
  # This makes current_guestaccount, a controller method, accessible in your views.
  helper_method :current_guestaccount
end
