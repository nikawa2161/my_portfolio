FactoryBot.define do
  factory :company do
    email { Faker::Internet.email }
    password { 'password' }
  end
end