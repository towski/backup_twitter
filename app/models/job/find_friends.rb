class Job::FindFriends < Job.new(:user_id)
  def self.create(screen_name)
    job = new(screen_name)
    if Rails.env == "production"
      Delayed::Job.enqueue job
    else
      job.perform
    end
  end

  def user
    @user ||= User.find user_id
  end

  def perform
    user.client.friends.each do |friend|
      new_user = User.first(:screen_name => friend.screen_name)
      if !new_user
        new_user = User.new 
        new_user.set_twitter_fields(friend)
        new_user.save
      end
      friendship = user.friendships.create :friend_id => new_user.id
      friendship.save
    end
  end
end
