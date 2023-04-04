class PostsController < ApplicationController
  before_action :authorized

  def new
    @post = Post.new
  end

  def create
    # Temporary put a hard title here
    @post = Post.new post_params.merge(user_id: current_user.id, title: "Random title")
    if @post.save
      redirect_to root_url, notice: "Created!"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :description)
  end
end
