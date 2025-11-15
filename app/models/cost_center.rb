class CostCenter < ApplicationRecord
  has_many :payment_plans

  validates :name, presence: true, uniqueness: true
end
