class User < ApplicationRecord
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events,foreign_key: :user_id, dependent: :destroy
  has_many :customers,foreign_key: :user_id, dependent: :destroy
end
