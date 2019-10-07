class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
  end

  def new
    @category = Category.find(params[:category_id])
    @post = @category.posts.new(post_params)
  end

  def edit
    # @category = Category.find(params[:category_id])
    # @post = @category.posts
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  def update
    @category = Category.find(params[:category_id])
    @post = @category.posts.update(post_params)
    if @post.update(post_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :category_id)
  end
end


