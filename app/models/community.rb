class Community < ApplicationRecord
  belongs_to :user
  has_many :community_members
  has_many :events
<<<<<<< HEAD
  has_many :joined_users, through: :community_members, source: :user
=======
  has_many :joined_users,through: :community_members,source: :user
>>>>>>> master
end
