class Review < ApplicationRecord

  belongs_to :product
  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true, numericality: {in: 1..5}
end
