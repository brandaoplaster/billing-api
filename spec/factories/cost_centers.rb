FactoryBot.define do
  factory :cost_center do
    name { Faker::Commerce.department }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    active { true }
  end
end
