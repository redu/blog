class TagsController < ApplicationController
	def index
		@tags = Tag.all
		@tags_new = Tag.new
		respond_to do |format_tag|
 			format_tag.html
		end
	end

	def create
		@tags = Tag.all
		@tag = Tag.new(params[:tag])
		respond_to do |format|
		
		@tags = @tags.map { |tag| tag.name }	
		unless @tags.include?(@tag.name)
			if @tag.save
				format.html { redirect_to :action => :index }
			end
		end
			@tags = Tag.all
			@tags_new = Tag.new
			flash.now[:notice] = 'This tag already exists'
			format.html { render :action => :index }
		end
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		respond_to do |format|
		  format.html {redirect_to :action => :index}
		end
	end
end
