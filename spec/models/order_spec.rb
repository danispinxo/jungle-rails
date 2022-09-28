require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(name: 'Tall Plant', description: 'A fairly tall plant that is perfect for tall people.', image: 'plante_image.jpg', price_cents: 3999, quantity: 12, category_id: 1)
      @product2 = Product.create!(name: 'Short Plant', description: 'A fairly short plant that is perfect for short people.', image: 'plante2_image.jpg', price_cents: 2999, quantity: 10, category_id: 1)
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(email: 'gnrforever@fakemail.com', total_cents: 3999, stripe_charge_id: 1)
      # 2. build line items on @order
      @order.line_items.new(product: @product1, quantity: 1, item_price_cents: 3999, total_price_cents: 3999)
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!  
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(11)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      @order = Order.new(email: 'gnrforever@fakemail.com', total_cents: 3999, stripe_charge_id: 1)
      @order.line_items.new(product: @product1, quantity: 1, item_price_cents: 3999, total_price_cents: 3999)
      @order.save!  
      @product1.reload
      @product2.reload
      expect(@product2.quantity).to eq(10)
    end
  end
end
