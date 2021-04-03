class User < ApplicationRecord
  has_secure_password
  has_many :user_events
  has_many :events, through: :user_events
  has_many :hosted_events, foreign_key: :host_id, class_name: "Event"
  has_many :shopping_lists, through: :hosted_events

  validates :name, presence: true
  validates :name, uniqueness: true
end
