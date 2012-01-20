class PostsController < ApplicationController
	
	before_filter :authenticate_user!, :except => [:index, :show]

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
