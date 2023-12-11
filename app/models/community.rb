class Community < ApplicationRecord
  belongs_to :user
  has_many :community_members
  has_many :events
  has_many :joined_users,through: :community_members,source: :user
  validates :name, :description, :topic, presence: true
  has_one_attached :photo
end
