class ArticlesController < ApplicationController
  require 'category'
    Category.new

  def index
    @categories = Category.all
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def showByCat
    @articles = Article.where("category_id = ?", params[:cat_id])
    render "artByCat"
  end
  
  def new
  
  end

  def edit
  end
end
