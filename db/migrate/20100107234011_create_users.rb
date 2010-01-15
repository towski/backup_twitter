class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :id => false do |t|
      t.timestamps
      t.text :attributes
      t.integer :added_id
      t.binary :id
    end

    create_table :index_users_on_screen_name, :id => false do |t|
      t.string :screen_name
      t.binary :id
    end
  end

  def self.down
    drop_table :users
  end
end
