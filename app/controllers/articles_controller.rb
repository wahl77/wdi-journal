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

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params[:article])

    if @article.save
      redirect_to "/articles/index"
    else
      render :new
      # In Sinatra, it would be `erb :new`.
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to "/articles/index"
    else
      render :edit
      # In Sinatra, it would be `erb :edit`.
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy

    redirect_to "/articles/index"
  end
end
