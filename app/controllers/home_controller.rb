class HomeController < ApplicationController
  skip_before_action :authorized
  
  def index
    @posts = Post.last(10).reverse
  end
end
