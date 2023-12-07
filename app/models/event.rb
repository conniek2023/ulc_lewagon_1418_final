class Event < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  belongs_to :community
  has_many :event_members
  has_many :joined_users,through: :event_members,source: :user
  validates :title, :type, :location, :start_at, :end_at, :introduction, presence: true
  self.inheritance_column = nil
end
