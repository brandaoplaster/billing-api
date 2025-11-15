FactoryBot.define do
  factory :charge do
    association :payment_plan
    amount { Faker::Commerce.price(range: 10.0..1000.0) }
    due_date { Faker::Date.forward(days: 30) }
    payment_method { [ :boleto, :pix ].sample }
    status { :issued }

    payment_code do
      if payment_method == :boleto
        Faker::Number.number(digits: 47).to_s
      else
        Faker::Alphanumeric.alphanumeric(number: 32)
      end
    end

    trait :paid do
      status { :paid }
    end

    trait :canceled do
      status { :canceled }
    end

    trait :boleto do
      payment_method { :boleto }
      payment_code { Faker::Number.number(digits: 47).to_s }
    end

    trait :pix do
      payment_method { :pix }
      payment_code { Faker::Alphanumeric.alphanumeric(number: 32) }
    end
  end
end
