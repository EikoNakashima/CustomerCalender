class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :customer_events
  has_many :customer,through: :customer_events
end
