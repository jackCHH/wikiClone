class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.all.order("CREATED_AT DESC")
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
		params.require(:article).permit(:title, :content)
	end

	def find_article
		@article = Article.find(params[:id])
	end
end
