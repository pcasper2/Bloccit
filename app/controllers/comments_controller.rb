class CommentsController < ApplicationController
  def create
    #@user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    #@comment.user = @user
    authorize @comment
    if  @comment.save
      flash[:notice] = "comment cretaed successfully."
    else
      flash[:error] = "There was an error saving the comment. Please try again"
      
    end
    redirect_to [@post.topic, @post]
  end

  #   authorize @comment

  #   if @comment.save
  #     flash[:notice] = "Comment was saved."
  #     redirect_to [@post, @comment]
  #   else
  #     flash[:error] = "There was an error saving the comment. Please try again."
  #     render :new
  #   end
  # end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
