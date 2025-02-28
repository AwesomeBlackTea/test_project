class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :topics
  has_many :comments, inverse_of: :post, dependent: :destroy

  validates :title, presence: true, length: { in: 2..30 }

  scope :recent, -> { order(created_at: :desc) }
  scope :high_rated, -> { order(rate: :desc) }
  scope :with_high_rated_comments, -> { joins(:comments).merge(Comment.high_rated) }
end
