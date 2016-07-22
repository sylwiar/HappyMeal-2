require 'rails_helper'

RSpec.describe Meal, type: :model do
  it "is invalid without name" do
    meal = Meal.new
    meal.valid?
    expect(meal.errors[:name]).to include("can't be blank")
  end

  it "is invalid without price" do
    meal = Meal.new
    meal.valid?
    expect(meal.errors[:price]).to include("can't be blank")
  end

  it "is invalid without order_id" do
    meal = Meal.new
    meal.valid?
    expect(meal.errors[:order_id]).to include("can't be blank")
  end

  it "is invalid without user_id" do
    meal = Meal.new
    meal.valid?
    expect(meal.errors[:user_id]).to include("can't be blank")
  end
end
