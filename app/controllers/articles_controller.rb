class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_company!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = current_company.articles.build
  end

  def create
    @article = current_company.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @article = current_company.articles.find(params[:id])
  end

  def update
    @article = current_company.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    article = current_company.articles.find(params[:id])
    article.destroy!
    redirect_to articles_path, notice: '削除に成功しました'
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :Job_title, :employment, :education, :licensure, :documents, :selection, :screening_location)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
