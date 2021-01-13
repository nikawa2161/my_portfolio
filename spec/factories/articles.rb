FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.characters(number: 30) }
    Job_title { Faker::Lorem.characters(number: 10) }
    employment { Faker::Lorem.characters(number: 10) }
    education { Faker::Lorem.characters(number: 10) }
    licensure { Faker::Lorem.characters(number: 10) }
    documents { Faker::Lorem.characters(number: 10) }
    selection { Faker::Lorem.characters(number: 10) }
    screening_location { Faker::Lorem.characters(number: 10) }
  end
end