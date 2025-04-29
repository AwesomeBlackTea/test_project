class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.all
  end

  def show
    @post = Post.includes(comments: :user).find(params[:id])
  end
end
