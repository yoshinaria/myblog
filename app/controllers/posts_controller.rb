class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(posts_params)
    if @post.valid?
      redirect_to root_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])

    if @post.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end  
  end

  
  def update
    @post = Post.find(params[:id])

    if @post.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end

    @post.update_attributes(posts_params)
    if @post.valid?
      redirect_to root_path
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end

    @post.destroy
    redirect_to root_path
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content)
  end

end
