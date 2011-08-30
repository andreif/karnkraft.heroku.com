class WelcomeController < ApplicationController
  def index
    @feed = 'RSS feed'
    @posts = Post.all.first(3)
  end

end
