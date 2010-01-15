class Job::UpdateHomeTimeline < Job.new(:screen_name)
  def user
    @user ||= User.first(:screen_name => screen_name)
  end

  def perform
    user.client.home_timeline.each do |tweet|
      existing_tweet = Tweet.first(:tweet_id => tweet.id)
      if existing_tweet
        return
      else
        friend = User.first :screen_name => tweet.user.screen_name
        if !friend
          friend = User.new
          friend.set_twitter_fields tweet.user
          friend.save
        end
        friend.tweets.create tweet.except(:created_at, :user, :id).merge(:tweet_id => tweet.id, :tweet_created_at => tweet.created_at)
      end
    end
  end
end
