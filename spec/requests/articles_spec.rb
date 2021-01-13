require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let!(:company) { create(:company) }
  let!(:articles) { create_list(:article, 3, company: company) }

  describe 'GET /articles' do
    it '200ステータスが返ってくる' do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end
end