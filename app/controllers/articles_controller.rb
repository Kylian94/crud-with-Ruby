class ArticlesController < ApplicationController
  require 'category'
    Category.new

  before_action :set_article, only: [:show, :edit, :update, :destroy]

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

  def destroy
    @article.destroy
    flash[:success] = "Article deleted"
    redirect_to request.referrer || root_url
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :desc)
    end
end
