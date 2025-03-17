class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :topics
  has_many :comments, inverse_of: :post, dependent: :destroy

  before_validation :normalize_title

  validates :title, presence: true, length: { in: 2..200 }

  scope :recent, -> { order(created_at: :desc) }
  scope :high_rated, -> { order(rate: :desc) }
  scope :with_high_rated_comments, -> { joins(:comments).merge(Comment.high_rated) }

  private

  def normalize_title
    self.title = title.strip.capitalize if title.present?
  end
end
