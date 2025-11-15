FactoryBot.define do
  factory :financial_guardian do
    name { Faker::Name.name }
    cpf { Faker::IdNumber.brazilian_citizen_number(formatted: true) }
  end
end
