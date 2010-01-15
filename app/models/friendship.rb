class Friendship
  include Friendly::Document

  attribute :friend_id, Friendly::UUID
  attribute :user_id, Friendly::UUID
  indexes :user_id
end
