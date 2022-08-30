require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "Save Validation" do
      it "saves when required fields are filled" do
        @category = Category.find_or_create_by! name: "Trees"
        @product = Product.create(
          name: "Orange Lily",
          description: "A gorgeous orange flower, introduced to North America some time ago, no grows in many unexpected places.",
          image: nil,
          quantity: 5,
          price: 7.50,
          category: @category,
        )

        @product.validate

        expect(@product.id).to eql(@product.id)
      end
    end

    context "Name Presence Validation" do

      it "validates that a name does exist when a name is set" do
        @category = Category.find_or_create_by! name: "Trees"
        @product = Product.create(
          name: "Orange Lily",
          description: "A gorgeous orange flower, introduced to North America some time ago, no grows in many unexpected places.",
          image: nil,
          quantity: 5,
          price: 7.50,
          category: @category,
        )

        @product.validate

        expect(@product.name).to be_present
      end

      it "validates that a name does not exist when a name is not set" do
        @category = Category.find_or_create_by! name: "Trees"
        @product = Product.create(
          description: "A gorgeous orange flower, introduced to North America some time ago, no grows in many unexpected places.",
          image: nil,
          quantity: 5,
          price: 7.50,
          category: @category,
        )

        @product.validate

        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context "Price Presence Validation" do

      it "validates that a price does exist when a price is set" do
        @category = Category.find_or_create_by! name: "Trees"
        @product = Product.create(
          name: "Orange Lily",
          description: "A gorgeous orange flower, introduced to North America some time ago, no grows in many unexpected places.",
          image: nil,
          quantity: 5,
          price: 7.50,
          category: @category,
        )

        @product.validate

        expect(@product.price).to be_present
      end

      it "validates that a price does not exist when a price is not set" do
        @category = Category.find_or_create_by! name: "Trees"
        @product = Product.create(
          name: "Orange Lily",
          description: "A gorgeous orange flower, introduced to North America some time ago, no grows in many unexpected places.",
          image: nil,
          quantity: 5,
          category: @category,
        )

        @product.validate

        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context "Quantity Presence Validation" do

      it "validates that a quantity does exist when a quantity is set" do
        @category = Category.find_or_create_by! name: "Trees"
        @product = Product.create(
          name: "Orange Lily",
          description: "A gorgeous orange flower, introduced to North America some time ago, no grows in many unexpected places.",
          image: nil,
          quantity: 5,
          price: 7.50,
          category: @category,
        )

        @product.validate

        expect(@product.quantity).to be_present
      end

      it "validates that a quantity does not exist when a quantity is not set" do
        @category = Category.find_or_create_by! name: "Trees"
        @product = Product.create(
          name: "Orange Lily",
          description: "A gorgeous orange flower, introduced to North America some time ago, no grows in many unexpected places.",
          image: nil,
          price: 7.50,
          category: @category,
        )

        @product.validate

        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context "Category Presence Validation" do

      it "validates that a category does exist when a category is set" do
        @category = Category.find_or_create_by! name: "Trees"
        @product = Product.create(
          name: "Orange Lily",
          description: "A gorgeous orange flower, introduced to North America some time ago, no grows in many unexpected places.",
          image: nil,
          quantity: 5,
          price: 7.50,
          category: @category,
        )

        @product.validate

        expect(@product.category).to be_present
      end

      it "validates that a category does not exist when a category is not set" do
        @category = Category.find_or_create_by! name: "Trees"
        @product = Product.create(
          name: "Orange Lily",
          description: "A gorgeous orange flower, introduced to North America some time ago, no grows in many unexpected places.",
          image: nil,
          quantity: 5,
          price: 7.50,
        )

        @product.validate

        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
