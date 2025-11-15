FactoryBot.define do
  factory :payment_plan do
    association :financial_guardian
    association :cost_center
  end
end
