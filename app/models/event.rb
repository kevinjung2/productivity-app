class Event < ApplicationRecord
  has_one :shopping_list
  has_many :user_events
  has_many :users, through: :user_events
  belongs_to :host, class_name: "User"

  scope :hosted, ->(var) {where(host_id: var)}
end
