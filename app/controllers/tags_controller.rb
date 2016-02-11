class TagsController < ApplicationController
	def show
		@tag = Tag.find_by(id: params[:id])
	end

	def index
		@tags = Tag.all
	end

	def destroy
		@taggers = Tagging.find_by(tag_id: params[:id])
		@taggers.destroy
		@tag = Tag.find_by(id: params[:id])
		@tag.destroy

		redirect_to tags_path
	end
end
