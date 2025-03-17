class Topic < ApplicationRecord
  has_and_belongs_to_many :posts

  validates :name, presence: true, length: { in: 2..30 }
end
