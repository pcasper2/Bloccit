class Topics::PostsController < ApplicationController
  #before_action :flash_attack
  #skip_before_action :flash_attack, only: [:index, :new]


  

#removed PostsController#index when I added topics.
#this was done because now posts are scoped by topics.
  # def index
  #   @posts = policy_scope(Post)
  # end

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    #@user = User.find(params[:user_id])
    @comments = @post.comments
    authorize @topic
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post
    #@post.save_with_initial_vote


    if @post.save_with_initial_vote
      #@post.create_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post. Please try again."
      render :show
    end
  end


  private 

  def post_params
    params.require(:post).permit(:title, :body, :image, :image_cache)
  end


  #protected

  #def flash_attack
  #  flash[:notice] = "assignment post only flash"
  #end

end
