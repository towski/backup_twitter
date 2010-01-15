User.blueprint do
  name { Faker::Name.name }
  twitter_id { Time.now.utc + rand(50) }
  twitter_name { Faker::Name.name.downcase }
end

Gift.blueprint do
  url { "http://flickr.com" }
end
