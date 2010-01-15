# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100115043242) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.text     "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :id => false, :force => true do |t|
    t.binary   "id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "index_friendships_on_user_id", :id => false, :force => true do |t|
    t.integer "user_id"
    t.binary  "id"
  end

  create_table "index_tweets_on_user_id", :id => false, :force => true do |t|
    t.binary  "id"
    t.integer "user_id"
  end

  create_table "index_users_on_screen_name", :id => false, :force => true do |t|
    t.string "screen_name"
    t.binary "id"
  end

  create_table "tweets", :id => false, :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "attributes"
    t.integer  "added_id"
    t.binary   "id"
  end

  create_table "users", :id => false, :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "attributes"
    t.integer  "added_id"
    t.binary   "id"
  end

end
