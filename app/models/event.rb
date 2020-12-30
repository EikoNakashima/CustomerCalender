class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :customer_events,dependent: :destroy
  has_many :customer,through: :customer_events,dependent: :destroy
end
