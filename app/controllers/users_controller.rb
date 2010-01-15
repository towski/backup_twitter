class UsersController < ApplicationController
  before_filter :user_required, :except => :create

  def show
    render :text => "hey"
  end

  def create
    oauth = Twitter::OAuth.new(OAuthConfig['consumer_token'], OAuthConfig['consumer_secret'])
    access_key, access_secret = oauth.authorize_from_request(session[:rtoken], session[:rsecret], params[:oauth_verifier])
    info = Twitter::Base.new(oauth).verify_credentials
    user = User.first(:screen_name => info.screen_name)
    if !user
      user = User.new
    end
    user.set_twitter_fields info
    user.access_key = access_key 
    user.access_secret = access_secret
    user.save
    session[:user_id] = user.screen_name
    Job::UpdateHomeTimeline.new(user.screen_name).perform
    redirect_to root_url
  end
end
