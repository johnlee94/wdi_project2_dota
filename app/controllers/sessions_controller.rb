class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by(username: params[:username].downcase)

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id.to_s
      redirect_to posts_path, notice: 'Successfully logged in!'
    else
      flash.now.alert = "Incorrect username or password, try again."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end

end
