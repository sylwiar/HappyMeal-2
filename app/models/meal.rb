class Meal < ActiveRecord::Base
  validates :name, :price, :order_id, :user_id, presence: true
  validates :price, numericality: true, allow_nil: true

  belongs_to :user
  belongs_to :order
end
