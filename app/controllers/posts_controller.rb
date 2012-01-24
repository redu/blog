class PostsController < ApplicationController

	before_filter :authenticate_user!, :except => [:index, :show, :search]

	def index
		@posts = Post.all
	end

    def new
      @post = Post.new
      respond_to do |format|
        format.html  # new.html.erb
      end
    end

    def create
      @post = Post.new(params[:post])
      respond_to do |format|
        if @post.save
          format.html { redirect_to @post }
        else
          format.html { render :action => 'new' }
        end
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to @post }
        else
          format.html { render :action => 'edit' }
        end
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end

    def show
      @post = Post.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
      end
    end

    # FIXME: melhorar busca!
    def search
      @posts = Post.search params[:search]
    end

    def mercury_update
		post = Post.find(params[:id])
		post.title = params[:content][:post_title][:value]
		post.body = params[:content][:post_body][:value]
		post.save
		render :text => ""
	end

end
