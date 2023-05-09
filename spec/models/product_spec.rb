require 'rails_helper'

RSpec.describe Product, type: :model do

  before do 
    category = Category.create(name: "Plants")
    category_id = category.id 
  end

  describe 'Validations' do
    it "saves the model if all fields are present" do 
      expect {
        Product.create!(name: "Lily", description: "im very unoriginal", price: 10, quantity: 15, category: Category.last)
      }.to change { Product.count }
    end

    it "adds appropriate error if name not provided" do 
      @product = Product.create(name: nil, description: "im very unoriginal", price: 10, quantity: 15, category: Category.last)
      expect(@product.errors.full_messages).not_to be_empty
      expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
    end

    it "adds appropriate error if price not provided" do 
      @product = Product.create(name: "Lily", description: "im very unoriginal", quantity: 15, category: Category.last)
      expect(@product.errors.full_messages).not_to be_empty
      expect(@product.errors.full_messages[0]).to eql("Price cents is not a number")
    end

    it "adds appropriate error if quantity not provided" do 
      @product = Product.create(name: "Lily", description: "im very unoriginal", price: 10, quantity: nil, category: Category.last)
      expect(@product.errors.full_messages).not_to be_empty
      expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
    end

    it "adds appropriate error if category not provided" do 
      @product = Product.create(name: "Lily", description: "im very unoriginal", price: 10, quantity: 25, category: nil)
      expect(@product.errors.full_messages).not_to be_empty
      expect(@product.errors.full_messages[0]).to eql("Category must exist")
    end

  end
end