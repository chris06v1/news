class SessionsController < ApplicationController

def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to posts_path, :notice => "Logged in!"
  else
    redirect_to log_in_path, :notice => "Invalid email or password"
  end
end

def log_out
  reset_session
  redirect_to log_in_path, :notice => "Logged out!"
end

end
