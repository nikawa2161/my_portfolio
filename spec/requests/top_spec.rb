require 'rails_helper'

RSpec.describe 'Top', type: :request do

  describe 'GET /top' do
    it '200ステータスが返ってくる' do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
