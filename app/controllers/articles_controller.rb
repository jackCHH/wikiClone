class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit, :update, :destroy]

	def index
	end

	def new
		@article = Article.new
	end

	def show

	end

	def create
		@article = Article.new(article_param)
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
