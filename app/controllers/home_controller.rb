class HomeController < ApplicationController
  before_action :authorized
  
  def index
    @posts = Post.last(10)
  end
end
