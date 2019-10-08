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

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_url, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to articles_url, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def showByCat
    @articles = Article.where("category_id = ?", params[:cat_id])
    render "artByCat"
  end
  
  def new
    @article = Article.new
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
      params.require(:article).permit(:title, :desc, :category_id)
    end
end
