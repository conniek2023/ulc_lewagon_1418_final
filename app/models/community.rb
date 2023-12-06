class Community < ApplicationRecord
  belongs_to :user
  has_many :community_members
  has_many :events
  has_many :joined_users, through: :community_members, source: :user
end
