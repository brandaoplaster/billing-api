FactoryBot.define do
  factory :payment do
    association :charge
    amount { charge.amount }
    payment_date { charge.due_date + rand(0..10).days }
  end
end
