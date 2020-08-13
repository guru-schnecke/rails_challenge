class CommentsController < ApplicationController
  def destroy
  end

  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment['post_id'] = @post.id
    @comment['user_id'] = current_user.id
    #  testing
    if @comment.save
      flash[:notice] = "Comment Created!"
      redirect_to post_path(@post.id)
    else
      flash[:alert] = "Comment Not Created!"
      redirect_to post_path(@post.id)
    end
  end


  private
  
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :post_id)
  end
end
