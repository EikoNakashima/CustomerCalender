class Customer < ApplicationRecord
  belongs_to :user, optional: true
  has_many :customer_events,dependent: :destroy
  has_many :events, through: :customer_events,dependent: :destroy

  validates :name,:user_id, presence: true
end
