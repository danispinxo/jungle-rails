class Review < ApplicationRecord
  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true, numericality: {in: 1..5}
end
