require 'rails_helper'

RSpec.describe Product, type: :model do
  before :each do
    @category = Category.new(name: 'Furniture')
  end

  it 'should save with all fields correct' do
    @product = Product.new(
      name: "Blow up doll",
      price: 10,
      quantity: 10,
      category: @category
      )
    expect(@product.valid?).to be(true)
    expect(@product.errors.messages).to eq({})
    puts @product.errors.messages
  end

  it 'should not save without a name' do
    @product = Product.new(
      price: 10,
      quantity: 10,
      category: @category
      )
    expect(@product.valid?).to be(false)
    expect(@product.errors.messages).to eq({:name=>["can't be blank"]})
    puts @product.errors.messages
  end

  it 'should not save without a price' do
    @product = Product.new(
      name: "fun toys",
      quantity: 10,
      category: @category
      )
    expect(@product.valid?).to be(false)
    expect(@product.errors.messages).to eq({:price_cents=>["is not a number"], :price=>["is not a number", "can't be blank"]})
    puts @product.errors.messages
  end

  it 'should not save without a quantity' do
    @product = Product.new(
      name: "fun toys",
      price: 10,
      category: @category
      )
    expect(@product.valid?).to be(false)
    expect(@product.errors.messages).to eq({:quantity=>["can't be blank"]})
    puts @product.errors.messages
  end

  it 'should not save without a category' do
    @product = Product.new(
      name: "fun toys",
      price: 10,
      quantity: 10
      )
    expect(@product.valid?).to be(false)
    expect(@product.errors.messages).to eq({:category=>["can't be blank"]})
    puts @product.errors.messages
  end

end
