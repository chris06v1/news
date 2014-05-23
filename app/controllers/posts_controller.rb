class PostsController < ApplicationController
  def index
    @posts = Post.where(state: "published")
    @posts.sort!{ |x, y| x.created_at <=> y.created_at }
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_attributes)
    if @post.save
      redirect_to posts_path, notice: t("controllers.posts.create.success")
    else
      render :new, notice: t("controllers.posts.create.failure")
    end
  end

  private

  def post_attributes
    params[:post].permit(:title, :url, :body, :user_id)
  end

end
