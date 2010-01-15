class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets, :id => false do |t|
      t.timestamps
      t.text :attributes
      t.integer :added_id
      t.binary :id
    end

    create_table :index_tweets_on_user_id, :id => false do |t|
      t.binary :id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :users
    drop_table :index_tweets_on_user_id
  end
end
