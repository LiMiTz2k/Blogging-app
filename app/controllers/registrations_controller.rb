class RegistrationsController < Devise::RegistrationsController
  def new
    @posts = Post.all
    super
  end

  def edit
    @posts = Post.all
    super
  end
end
