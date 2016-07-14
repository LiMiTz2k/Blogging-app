class RegistrationsController < Devise::RegistrationsController

  def new
    @posts = Post.all
    super
  end
end
