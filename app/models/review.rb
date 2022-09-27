class Review < ApplicationRecord
  validates :product, presence: true
  validates :user, presence: true
  validates :rating, presence: true, numericality: {in: 1..5}
end
