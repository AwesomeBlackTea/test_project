class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, inverse_of: :comments

  before_validation :normalize_title

  validates :title, presence: true, length: { in: 2..200 }

  scope :recent, -> { order(created_at: :desc) }
  scope :high_rated, -> { order(rate: :desc) }

  private

  def normalize_title
    self.title = title.strip.capitalize if title.present?
  end
end
