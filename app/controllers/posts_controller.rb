class PostsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @post = Post.all
  end

  def show
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @post = @category.posts.new(post_params)
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.new(post_params)
      if @post.save
        redirect_to @category
      else
        render 'new'
      end
  end

  def update
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to @category
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :category_id, :image)
  end
end


