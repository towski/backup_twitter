# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
protected
  def current_user 
    @current_user ||= login_from_session
  end

  def current_user=(new_user)
    session[:user_id] = new_user ? new_user.screen_name : nil
    @current_user = new_user || false
  end

  def user_required
    current_user || redirect_to_oauth
  end

  def redirect_to_oauth
    oauth = Twitter::OAuth.new(OAuthConfig['consumer_key'], OAuthConfig['consumer_secret'])
    oauth.set_callback_url create_user_url
    session[:rtoken] = oauth.request_token.token
    session[:rsecret] = oauth.request_token.secret
    redirect_to oauth.request_token.authorize_url
  end

  def login_from_session
    if session[:user_id]
      user = User.first(:screen_name => session[:user_id])
      if user
        self.current_user = user
      else
        session[:user_id] = nil
      end
    end
  end
end
