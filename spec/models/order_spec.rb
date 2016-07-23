require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is invalid without restaurant_name" do
    order = Order.new
    order.valid?
    expect(order.errors[:restaurant_name]).to include("can't be blank")
  end

  it "is invalid without status" do
    order = Order.new
    order.valid?
    expect(order.errors[:status]).to include("can't be blank")
  end
end
