FactoryBot.define do
  factory :profile do
    nickname { Faker::Lorem.characters(number: 10) }
    last_name { Faker::Lorem.characters(number: 30) }
    first_name { Faker::Lorem.characters(number: 10) }
    kana_last_name { Faker::Lorem.characters(number: 10) }
    kana_first_name { Faker::Lorem.characters(number: 10) }
    # gender { Faker::Lorem.characters(number: 10) }
    # birthday { Faker::Lorem.characters(number: 10) }
    address { Faker::Lorem.characters(number: 10) }
    phone_number { Faker::Lorem.characters(number: 10) }
  end
end

