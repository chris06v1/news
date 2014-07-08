class UsersController < ApplicationController

  before_filter :logout_required, :only => [ :new ]
  before_filter :admin_required, :only => [ :edit, :update ]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to posts_path, notice: t("controllers.users.create.success")
    else
      render :new, notice: ("#{@user.errors.full_messages.first}")
    end
  end

  def edit
    @user = User.find(params[:id])
    render :new
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    if @user.errors.any?
      flash[:notice] = "#{@user.errors.full_messages.first}"
    else
      redirect_to posts_path, :notice => "User Updated sucessfully"
    end
  end

end
