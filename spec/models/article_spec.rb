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

  context 'タイトルが未入力の場合'do
    let!(:article) { build(:article, title: nil, company: company) }
    before do
      article.save
    end  
    it'記事が保存できない'do
      expect(article.errors.messages[:title]).to include("を入力してください", "は2文字以上で入力してください")
    end
  end

  context '本文が未入力の場合'do
    let!(:article) { build(:article, body: nil, company: company) }
    before do
      article.save
    end  
    it'記事が保存できない'do
      expect(article.errors.messages[:body]).to include("を入力してください")
    end
  end

  context '応募職種が未入力の場合'do
    let!(:article) { build(:article, Job_title: nil, company: company) }
    before do
      article.save
    end  
    it'記事が保存できない'do
      expect(article.errors.messages[:Job_title]).to include("を入力してください")
    end
  end

  context '雇用形態が未入力の場合'do
    let!(:article) { build(:article, employment: nil, company: company) }
    before do
      article.save
    end  
    it'記事が保存できない'do
      expect(article.errors.messages[:employment]).to include("を入力してください")
    end
  end

  context '学歴が未入力の場合'do
    let!(:article) { build(:article, education: nil, company: company) }
    before do
      article.save
    end  
    it'記事が保存できない'do
      expect(article.errors.messages[:education]).to include("を入力してください")
    end
  end

  context '必須免許が未入力の場合'do
    let!(:article) { build(:article, licensure: nil, company: company) }
    before do
      article.save
    end  
    it'記事が保存できない'do
      expect(article.errors.messages[:licensure]).to include("を入力してください")
    end
  end

  context '応募書類が未入力の場合'do
    let!(:article) { build(:article, documents: nil, company: company) }
    before do
      article.save
    end
    it'記事が保存できない'do
      expect(article.errors.messages[:documents]).to include("を入力してください")
    end
  end

  context '選考方法が未入力の場合'do
    let!(:article) { build(:article, selection: nil, company: company) }
    before do
      article.save
    end  
    it'記事が保存できない'do
      expect(article.errors.messages[:selection]).to include("を入力してください")
    end
  end

  context '選考場所が未入力の場合'do
    let!(:article) { build(:article, screening_location: nil, company: company) }
    before do
      article.save
    end  
    it'記事が保存できない'do
      expect(article.errors.messages[:screening_location]).to include("を入力してください")
    end
  end
end
