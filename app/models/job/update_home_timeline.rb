class Job::UpdateHomeTimeline < Job.new(:user_id)
  def perform
    user.client.home_timeline
  end
end
