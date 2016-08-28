class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    if current_user.admin?
      @post = Post.new
    else
      redirect_to root_path
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to Post.all.order('created_at DESC')
    else
      render 'new'
    end
    
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    if current_user.admin?
      @post = Post.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
