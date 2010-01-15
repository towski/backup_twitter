class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships, :id => false do |t|
      t.binary :id
      t.text :attributes
      t.integer :added_id
      t.timestamps
    end

    create_table :index_friendships_on_user_id, :id => false do |t|
      t.binary :user_id
      t.binary :id
    end
  end

  def self.down
    drop_table :friendships
  end
end
