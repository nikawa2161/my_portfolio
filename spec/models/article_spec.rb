require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:company) { create(:company) }
  
  context '必須項目が入力されている場合'do
   

   let!(:article) do
    company.articles.build({
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
      expect(article).to be_valid
    end
  end
  context 'タイトルが一文字の場合' do
    let!(:article) do
      company.articles.create({
        title: Faker::Lorem.characters(number: 1),
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

    it'記事が保存できない'do
      expect(article.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end
end