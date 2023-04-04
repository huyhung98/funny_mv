class PostsController < ApplicationController
  before_action :authorized

  def new
    @post = Post.new
  end

  def create
    if working_url?(post_params[:content])
      video = VideoInfo.new(post_params[:content])
      @post = Post.new post_params.merge(user_id: current_user.id, title: video.title, description: video.description)
      if @post.save
        return redirect_to root_url, notice: "Created!"
      else
        flash[:alert] = "#{@post.errors.full_messages.first}"
        return render :new
      end
    end
    redirect_to new_post_url, notice: "Created fail!"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :description)
  end

  def working_url?(url)
    VideoInfo.new(url)
  rescue VideoInfo::UrlError
    false
  end
end
