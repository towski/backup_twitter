class Job::FindFriends < Job.new(:user_id)
  def self.create(user_id)
    job = new(user_id)
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
      user = User.new 
      user.set_twitter_fields(friend)
      user.save
      friendship = user.friendships.new :user_id => user.id
      friendship.save
    end
  end
end
