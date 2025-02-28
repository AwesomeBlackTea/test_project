class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :topics
  has_many :comments, inverse_of: :post, dependent: :destroy
end
