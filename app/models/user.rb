class User < ApplicationRecord
  has_secure_password
  acts_as_voter

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
