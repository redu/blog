class PostsController < ApplicationController

	before_filter :authenticate_user!, :except => [:index, :show, :search]

	def index
		@posts = Post.all
	end

    def new
      @post = Post.new
      @tag = Tag.all
      respond_to do |format|
        format.html  # new.html.erb
      end
    end

    def create
      @post = Post.new(params[:post])
      @tag = Tag.all
      tags_checked = params[:tags_post].collect
      tags_checked.each do |tag_checked|
        @post.tags<<Tag.find(tag_checked)
      end

      respond_to do |format|
        if @post.save
          format.html { redirect_to @post }
        else
	  flash.now[:notice] = params[:tags_post]
	  flash.now[:alert] = params[:post]
          format.html { render :action => 'new' }
        end
      end
    end

    def edit
      @post = Post.find(params[:id])
      @tag = Tag.all
    end

    def update
      @post = Post.find(params[:id])
      @tag = Tag.all
      tags_checked = params[:tags_post].collect
      tags_checked.each do |tag_checked|
        @post.tags<<Tag.find(tag_checked)
      end

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

	def feed
		@posts = Post.order
		respond_to do |format|
			format.rss {render :layout => false } #feed.rss.builder
			format.json {renter :layout => false}
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
