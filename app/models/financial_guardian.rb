class FinancialGuardian < ApplicationRecord
  has_many :payment_plans

   validates :name, presence: true
   validates :cpf, presence: true, uniqueness: { case_sensitive: false }
end
