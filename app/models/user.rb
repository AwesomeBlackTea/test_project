class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A[^@\s]+@[^@\s]+\z/,
    message: 'must be valid email'
  }
  validates :phone, presence: true, uniqueness: true, length: { in: 7..12 }
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
end
