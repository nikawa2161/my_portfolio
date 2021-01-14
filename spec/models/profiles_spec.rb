require 'rails_helper'

RSpec.describe Profile, type: :model do
  let!(:user) { create(:user) }

  context '必須項目が入力されている場合'do

   let!(:profile) { build(:profile, user: user) }

    it'プロフィールが保存できる'do
      expect(profile).to be_valid
    end
  end
end
