class Order < ActiveRecord::Base
  kinds = %w(Draft Finalized Ordered Delivered)
  attr_accessor :active_status
  validates :restaurant_name, presence: true
  validates :status, inclusion: { in: kinds }

  has_many :meals
  has_many :users, through: :meals

  scope :history, -> { where.not(status: 'Draft') }
  scope :active, -> { where(status: 'Draft') }
end