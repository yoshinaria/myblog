class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @posts = Post.find(:id)
  end

  def create
    
  end

  def edit
    
  end

  def delete
    
  end

end
