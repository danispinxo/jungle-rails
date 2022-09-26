require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    cat1 = Category.find_or_create_by! name: 'Evergreens'

    it 'should have one item created after being created' do
      
      @product = Product.create(name: "Plant Name", price_cents: 6999, quantity: 12, category: cat1)

      expect(Product.all.count).to eq(1)
    end

    it 'should not create a valid item without a name' do
      
      @product = Product.create(price_cents: 6999, quantity: 12, category: cat1)

      expect(@product.errors.full_messages).to include("Name can't be blank")
      expect(@product).to_not be_valid
    end

    it 'should not create a valid item without a quantity' do
      @product = Product.create(name: "Sample flower", price_cents: 6999, category: cat1)

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      expect(@product).to_not be_valid
    end

    it 'should not create a valid item without a category' do
      @product = Product.create(name: "Sample flower", price_cents: 6999, quantity: 70)

      expect(@product.errors.full_messages).to include("Category can't be blank")
      expect(@product).to_not be_valid
    end

    it 'should not create a valid item without a valid price' do
      @product = Product.create(name: "Sample flower", quantity: 70, category: cat1)

      expect(@product.errors.full_messages).to include("Price cents can't be blank")
      expect(@product).to_not be_valid
    end

  end
end
