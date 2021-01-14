require 'rails_helper'

RSpec.describe 'Companies', type: :request do

  context 'バリデーション' do

    it '姓、名、メール、パスワードがある場合、有効である' do
      company = FactoryBot.build(:company)
      expect(company).to be_valid
    end

    it 'メールアドレスがない場合、無効である'  do
      company = FactoryBot.build(:company, email: nil)
      company.valid?
      expect(company.errors[:email]).to include('を入力してください')
    end

    it '重複したメールアドレスの場合、無効である' do
      company1 = FactoryBot.create(:company, email: 'testman@example.com')
      company2 = FactoryBot.build(:company, email: 'testman@example.com')
      company2.valid?
      expect(company2.errors[:email]).to include('はすでに存在します')
    end

    it 'パスワードがない場合、無効である' do
      company = FactoryBot.build(:company, password: nil)
      company.valid?
      expect(company.errors[:password]).to include('を入力してください')
    end

  end
end
