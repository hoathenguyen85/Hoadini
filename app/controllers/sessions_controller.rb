class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      #flash notice try again
      redirect_to '/login' #root_path?
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end