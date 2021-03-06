class ArticlesController < ApplicationController

	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.tag_list = params[:article][:tag_list]
		@article.save
		flash.notice = "Article '#{@article.title}' created!"
		redirect_to article_path(@article)
	end

	def show
		@article = Article.find(params[:id])
		# byebug
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def destroy				# Rails destroy == HTML delete
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article '#{@article.title}' destroyed!"
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		flash.notice = "Article '#{@article.title}' updated!"
		redirect_to article_path(@article)
	end

end
