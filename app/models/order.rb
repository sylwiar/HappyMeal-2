class Order < ActiveRecord::Base
  kinds = %w(Draft Finalized Ordered Delivered)
  validates :restaurant_name, presence: true
  validates :status, inclusion: { in: kinds }

  has_many :meals
  has_many :users, through: :meals

  scope :active, -> { where(status: 'Draft') }
  scope :history, -> { where.not(status: 'Draft') }
end