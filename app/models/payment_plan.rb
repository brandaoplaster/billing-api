class PaymentPlan < ApplicationRecord
  belongs_to :financial_guardian
    belongs_to :cost_center
    has_many :charges

    validates :cost_center_id, uniqueness: { scope: :financial_guardian_id }
    validate :must_have_at_least_one_charge, on: :update

    private

    def must_have_at_least_one_charge
      if charges.empty?
        errors.add(:base, "Payment plan must have at least one charge")
      end
    end
end
