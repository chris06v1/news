class PostsController < ApplicationController

  before_filter :login_required
  before_filter :admin_required, :only => [ :destroy, :down_vote ]

  def index
    @posts = Post.state('published').paginate(:page => params[:page])
  end

  def my_posts
    params[:state] ||= "published"
    @posts = current_user.posts.state(params[:state]).paginate(:page => params[:page])
    render :index
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(params[:post])
    if @post.save
      redirect_to posts_path, :notice => t("controllers.posts.create.success")
    else
      flash[:notice] = t("controllers.posts.create.failure")
      render :new
    end
  end

  def up_vote
    up_vote = current_user.up_votes.new(:post_id => params[:id])

    if up_vote.save
      redirect_to posts_path(:page => params[:page]), :notice => 'Up Voted sucessfully'
    else
      redirect_to posts_path(:page => params[:page]), :notice =>  "#{up_vote.errors.full_messages.first}"
    end
  end

  def down_vote
    down_vote = current_user.down_votes.new(:post_id => params[:id])

    if down_vote.save
      redirect_to posts_path(:page => params[:page]), :notice => 'Down Voted sucessfully'
    else
      redirect_to posts_path(:page => params[:page]), :notice =>  "#{down_vote.errors.full_messages.first}"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    if @post.errors.any?
      redirect_to posts_path(:page => params[:page]), :notice =>  "#{@post.errors.full_messages.first}"
    else
      redirect_to posts_path(:page => params[:page]), :notice => 'Post deleted sucessfully'
    end
  end

end
