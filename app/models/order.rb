class Order < ApplicationRecord
  after_create :adjust_inventory
  
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def adjust_inventory
    line_items.each do |item|

      product = Product.find_by(id: item.product_id)

      new_quantity = product.quantity - item.quantity
      product.update(quantity: new_quantity)

    end
  end

end
