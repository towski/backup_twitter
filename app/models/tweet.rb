class Tweet
  include Friendly::Document

  attribute :truncated
  attribute :favorited
  attribute :text
  attribute :tweet_id
  attribute :contributors
  attribute :geo
  attribute :in_reply_to_user_id
  attribute :in_reply_to_status_id
  attribute :source
  attribute :in_reply_to_screen_name
  attribute :tweet_created_at
  attribute :retweeted_status
  attribute :user_id, Friendly::UUID
  indexes :user_id
  indexes :tweet_id

  def self.create tweet
    options = tweet.except("created_at", "id").merge("tweet_id" => tweet["id"], "tweet_created_at" => tweet["created_at"])
    super options
  end

  def user
    User.first(:id => user_id)
  end
end
