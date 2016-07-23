class Order < ActiveRecord::Base
  validates :restaurant_name, presence: true
  validates :status, presence: true

  has_many :meals
  has_many :users, through: :meals

  ORDER_STATUSES = [Draft = 'active', Finalized = 'history'] 

  # scope :active, -> { where(status: 'Draft') }
  # scope :history, -> { where.not(status: 'Draft') }
end