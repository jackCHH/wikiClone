class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:category].blank?
			@articles = Article.all.order("CREATED_AT DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@articles = Article.where(category_id: @category_id).order("CREATED_AT DESC")
		end
	end

	def new
		@article = current_user.articles.build
	end

	def show

	end

	def create
		@article = current_user.articles.build(article_param)
		if @article.save
			redirect_to @article
		else
			render "new"
		end
	end

	private

	def article_param
		params.require(:article).permit(:title, :content, :category_id)
	end

	def find_article
		@article = Article.find(params[:id])
	end
end
