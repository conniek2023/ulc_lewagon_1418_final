class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :community_members,
  has_many :community_members
  has_many :communities
  has_many :joined_communities, through: :community_members, source: :community
  has_many :events
  has_many :event_members
  has_many :joined_events, through: :event_members, source: :event
end
