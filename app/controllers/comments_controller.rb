class CommentsController < ApplicationController
  def create
    if params[:post_id]
      @category = Category.find(params[:category_id])
      @post = @category.posts.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      redirect_to category_post_path(@category, @post)
    else
      @category = Category.find(params[:category_id])
      @comment = @category.comments.create(comment_params)
      redirect_to category_path(@category)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :text)
  end
end
