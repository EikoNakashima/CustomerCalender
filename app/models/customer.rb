class Customer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :customer_events
  has_many :events, through: :customer_events
end
