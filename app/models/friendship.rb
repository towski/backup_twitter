class Friendship
  include Friendly::Document

  belongs_to :follower, :class_name => "User"
  belongs_to :following, :class_name => "User"

  indexes
end
