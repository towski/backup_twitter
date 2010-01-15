class Tweet
  include Friendly::Document

  attribute :user_id, Friendly::UUID
  indexes :user_id
end
