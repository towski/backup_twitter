Sinatra::Application.set(:run, false)
Sinatra::Application.set(:environment, :development)
Api = Sinatra::Application unless defined? Api

class Poller < Sinatra::Base
  STATUS = {:source => 'github', :source_href => 'http://github.com'}.freeze
  register Sinatra::TwitterServer

  twitter_basic_auth do |user, pass|
    {:user => user, :token => pass}
  end

  twitter_statuses_home_timeline do |params|
    [STATUS.merge(:id => 1, :text => "hey", :user => {:screen_name => "towski"}, :created_at => Time.now)]
  end
end
