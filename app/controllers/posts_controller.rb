class PostsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :search, :search_tags]

  def index
    @posts = Post.all
    @tags = Tag.all
      respond_to do |format|
        format.html
        format.rss {render :layout => false } #feed.rss.builder
      end
  end

  def new
    @post = Post.new
    @post.tags.build
    respond_to do |format|
      format.html  # new.html.erb
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.update_tags(params[:tag])
    @post.user_id = current_user.id
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
    @post.tags.build
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        @post.update_tags params[:tag]
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
    @tags = @post.tags
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def search
    @posts = Post.search params[:search]
  end

  def search_tags
    @posts = Tag.find(params[:id]).posts
  end

  def archive
    @tags = Tag.all
    @posts = Post.filter_archive(params[:year], params[:month])
  end
end
