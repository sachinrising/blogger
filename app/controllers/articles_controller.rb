class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find_by(id: params[:id])

		@comment = Comment.new

		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find_by(id: params[:id])
	end

	def create
		@article = Article.new(permissible_params)

		if @article.save
			flash[:success] = "Successfully Created"
			redirect_to article_path(@article)
		else
			flash[:error] = "Failed to create the article"
			render 'new'
		end
	end

	def update

		@article = Article.find_by(id: params[:id])

		@article.update(permissible_params)

		flash.notice = "Artice '#{@article.title}' Updated!"

		redirect_to articles_path(@article)
	end

	def destroy
		Article.find_by(id: params[:id]).destroy
		redirect_to articles_path
	end

end
