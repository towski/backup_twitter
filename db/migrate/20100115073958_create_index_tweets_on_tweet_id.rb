class CreateIndexTweetsOnTweetId < ActiveRecord::Migration
  def self.up
    create_table :index_tweets_on_tweet_id, :id => false do |t|
      t.binary :id
      t.string :tweet_id
    end
  end

  def self.down
    drop_table :index_tweets_on_tweet_id
  end
end
