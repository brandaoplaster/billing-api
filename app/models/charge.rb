class Charge < ApplicationRecord
  belongs_to :payment_plan
  has_many :payments

  validates :amount, presence: true
  validates :due_date, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true
  validates :payment_code, uniqueness: true, allow_nil: true

  enum :payment_method, [ :boleto, :pix ]
  enum :status, [ :issued, :paid, :canceled ]
end
