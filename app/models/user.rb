class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments

  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A[^@\s]+@[^@\s]+\z/,
    message: 'must be valid email'
  }
  validates :phone, presence: true, uniqueness: true, length: { in: 7..20 }
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :birthday, presence: true

  after_destroy :remove_from_cache

  scope :active, -> { where(active: true) }
  scope :with_high_rated_posts, -> { joins(:posts).merge(Post.high_rated) }
  scope :with_high_rated_comments, -> { joins(:comments).merge(Comment.high_rated) }

  private

  def remove_from_cache
    Rails.cache.delete("user_#{id}")
  end
end
