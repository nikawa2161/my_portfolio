require 'rails_helper'

RSpec.describe CompanyProfile, type: :model do
  let!(:company) { create(:company) }

  context '必須項目が入力されている場合'do

   let!(:company_profile) { build(:company_profile, company: company) }

    it'プロフィールが保存できる'do
      expect(company_profile).to be_valid
    end
  end
end

