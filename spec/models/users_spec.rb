require 'rails_helper'

RSpec.describe 'Users', type: :request do

  context 'バリデーションの検証' do

    it 'メールアドレス、パスワードがある場合、有効である' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it 'メールアドレスがない場合、無効である'  do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it '重複したメールアドレスの場合、無効である' do
      user1 = FactoryBot.create(:user, email: 'testman@example.com')
      user2 = FactoryBot.build(:user, email: 'testman@example.com')
      user2.valid?
      expect(user2.errors[:email]).to include('はすでに存在します')
    end

    it 'パスワードがない場合、無効である' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end

  end
end
