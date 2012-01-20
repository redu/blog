class TagsController < ApplicationController
	def index
		@tags = Tag.all
		@tags_new = Tag.new
		respond_to do |format_tag|
 			format_tag.html
		end
	end

	def create
		@tags = Tag.new(params[:tag])
		respond_to do |format|
		 if @tags.save
		 else
		 end
		end 
	end
end
