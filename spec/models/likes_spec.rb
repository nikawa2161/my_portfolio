require 'rails_helper'

RSpec.describe Like, type: :model do

  let(:association) do
    described_class.reflect_on_association(target)
 end

  context 'Articleモデルとの関係' do
    let(:target) { :article }
    it '多:1' do
      expect(association.macro).to eq :belongs_to
    end
    it '結合するモデルのクラス名：Article' do
      expect(association.class_name).to eq 'Article'
    end
  end
  context 'Userモデルとの関係' do
    let(:target) { :user }
    it '多:1' do
      expect(association.macro).to eq :belongs_to
    end
    it '結合するモデルのクラス名：User' do
      expect(association.class_name).to eq 'User'
    end
  end
end
