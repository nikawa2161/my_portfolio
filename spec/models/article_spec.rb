require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:company) { create(:company) }

  context '必須項目が入力されている場合'do

   let!(:article) { build(:article, company: company) }

    it'記事が保存できる'do
      expect(article).to be_valid
    end
  end
  context 'タイトルが一文字の場合' do
    let!(:article) { build(:article, title: Faker::Lorem.characters(number: 1), company: company) }

    before do
      article.save
    end

    it'記事が保存できない'do
      expect(article.errors.messages[:title]).to include('は2文字以上で入力してください')
    end
  end
end
