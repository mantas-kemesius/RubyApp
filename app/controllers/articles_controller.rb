# frozen_string_literal: true

# articles controller class
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = params[:article]
  end

  #  def update
  #    @article = Article.find params[:id]
  #
  #    if @article.update(article_params)
  #      redirect_to @article
  #    else
  #      render 'edit'
  #    end
  #  end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
