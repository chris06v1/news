class PostsController < ApplicationController

  before_filter :login_required
  before_filter :admin_required, :only => [ :destroy, :down_vote ]

  def index
    @posts = Post.where(state: "published").order(:created_at).paginate(:page => params[:page])
  end

  def my_posts
    params[:state] ||= "published"
    @posts = current_user.posts.where(state: params[:state]).order(:created_at).paginate(:page => params[:page])
    render :index
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(params[:post])
    if @post.save
      redirect_to posts_path, :notice => 'Post created sucessfully'
    else
      flash[:notice] = t("controllers.posts.create.failure")
      render :new
    end
  end

  def up_vote
    up_vote = current_user.up_votes.create(:post_id => params[:id])

    if up_vote.errors.any?
      redirect_to posts_path(:page => params[:page]), :notice =>  "#{up_vote.errors.full_messages.first}"
    else
      redirect_to posts_path(:page => params[:page]), :notice => 'Up Voted sucessfully'
    end
  end

  def down_vote
    down_vote = current_user.down_votes.create(:post_id => params[:id])

    if down_vote.errors.any?
      redirect_to posts_path(:page => params[:page]), :notice =>  "#{down_vote.errors.full_messages.first}"
    else
      redirect_to posts_path(:page => params[:page]), :notice => 'Down Voted sucessfully'
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
