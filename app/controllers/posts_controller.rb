class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

    def new
      @post = Post.new
      respond_to do |format|
        format.html  # new.html.erb
      end
    end
end
