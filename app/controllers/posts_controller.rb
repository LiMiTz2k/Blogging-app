class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post, @posts = Post.new, current_user.posts.all
  end

  def show
    @posts = User.find_by(email: current_user.email).posts
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(current_user.id)
    else
      redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
