require 'rails_helper'

RSpec.describe Article, type: :model do
  context '必須項目が入力されている場合'do
    before do
      company = Company.create!({
        email: 'test@example.com',
        password: 'password'
      })
      @article = company.articles.build({
        title: Faker::Lorem.characters(number: 10),
        body: Faker::Lorem.characters(number: 30),
        Job_title: Faker::Lorem.characters(number: 10),
        employment: Faker::Lorem.characters(number: 10),
        education: Faker::Lorem.characters(number: 10),
        licensure: Faker::Lorem.characters(number: 10),
        documents: Faker::Lorem.characters(number: 10),
        selection: Faker::Lorem.characters(number: 10),
        screening_location: Faker::Lorem.characters(number: 10)
      })
    end
    it'記事が保存できる'do
      expect(@article).to be_valid
    end
  end
end