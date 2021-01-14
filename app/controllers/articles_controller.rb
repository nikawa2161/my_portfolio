class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_company!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all

    if user_signed_in?
      @companies = Company.all
      rooms = current_user.rooms
      #自分が入ってるroomの相手のidを格納する
      @company_ids = []
      rooms.each do |r|
        @company_ids << r.company_id
      end
    elsif company_signed_in?
      @users = User.all
      rooms = current_company.rooms
      #自分が入ってるroomの相手のidを格納する
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end

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
    params.require(:article).permit(:title, :body, :Job_title, :employment, :education, :licensure, :documents, :selection, :screening_location, :eyecatch)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
