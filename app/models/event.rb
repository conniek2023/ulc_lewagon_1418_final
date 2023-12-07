class Event < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :event_members
  has_many :joined_users,through: :event_members,source: :user
  validates :title, :type, :location, :start_at, :end_at, :introduction, presence: true
end
