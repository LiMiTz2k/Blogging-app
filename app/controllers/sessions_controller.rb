class SessionsController < Devise::SessionsController
  def new
    @posts = Post.all
    super
  end
end
