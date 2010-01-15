class User
  include Friendly::Document
  attribute :screen_name
  attribute :status
  attribute :profile_sidebar_fill_color
  attribute :name
  attribute :profile_sidebar_border_color
  attribute :profile_link_color
  attribute :profile_background_tile
  attribute :url
  attribute :contributors_enabled
  attribute :favourites_count
  attribute :twitter_id
  attribute :description
  attribute :lang
  attribute :profile_text_color
  attribute :protected
  attribute :utc_offset
  attribute :verified
  attribute :profile_background_color
  attribute :geo_enabled
  attribute :time_zone
  attribute :notifications
  attribute :screen_name
  attribute :statuses_count
  attribute :followers_count
  attribute :friends_count
  attribute :profile_background_image_url
  attribute :twitter_created_at
  attribute :profile_image_url
  attribute :following
  attribute :location
  attribute :access_key
  attribute :access_secret

  indexes :screen_name

  has_many :friendships
  has_many :tweets

  def oauth
    @oauth ||= Twitter::OAuth.new(OAuthConfig['consumer_key'], OAuthConfig['consumer_secret'])
  end

  def client
    @client ||= begin
      oauth.authorize_from_access(access_key, access_secret)
      Twitter::Base.new(oauth)
    end
  end

  def set_twitter_fields(twitter_user)
    fields = twitter_user.except(:id, :created_at, :status).merge(:twitter_id => twitter_user.id, :twitter_created_at => Time.parse(twitter_user.created_at))
    fields.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end
