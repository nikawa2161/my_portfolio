class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :Job_title, :employment, :education, :licensure, :documents, :selection, :screening_location)
  end
end
