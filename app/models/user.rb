class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :meals
  has_many :orders
end