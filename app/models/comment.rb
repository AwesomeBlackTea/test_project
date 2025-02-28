class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, inverse_of: :comment

  validates :title, presence: true, length: { in: 2..20 }

  scope :recent, -> { order(created_at: :desc) }
  scope :high_rated, -> { order(rate: :desc) }
end
