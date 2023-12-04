class Event < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :event_members
  has_many :joined_users,through: :event_members,source: :user
end
