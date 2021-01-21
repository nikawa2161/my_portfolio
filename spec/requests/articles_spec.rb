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

  describe 'GET /article' do
    it '200ステータスが返ってくる' do
      get article_path(articles)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /articles' do
    context 'ログインしている場合' do
      before do
        sign_in company
      end

      it '記事が保存される' do
        article_params = attributes_for(:article)
        post articles_path({article: article_params})
        expect(response).to have_http_status(302)
        expect(Article.last.title).to eq(article_params[:title])
        expect(Article.last.body).to eq(article_params[:body])
        expect(Article.last.Job_title).to eq(article_params[:Job_title])
        expect(Article.last.employment).to eq(article_params[:employment])
        expect(Article.last.education).to eq(article_params[:education])
        expect(Article.last.licensure ).to eq(article_params[:licensure ])
        expect(Article.last.documents).to eq(article_params[:documents])
        expect(Article.last.selection).to eq(article_params[:selection])
        expect(Article.last.screening_location ).to eq(article_params[:screening_location ])
      end
    end

    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        article_params = attributes_for(:article)
        post articles_path({article: article_params})
        expect(response).to redirect_to(new_company_session_path)
      end
    end
  end
end
