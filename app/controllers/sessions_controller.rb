class SessionsController < ApplicationController

  def new
  end

  def create
    u = User.find_by(username: params[:user][:username])

    if u && u.authenticate(params[:user][:password])
      session[:user_id] = u.id
      redirect_to gifs_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
