class UsersController < ApplicationController
  def index
    @posts = Post.all
  end

  #FIrst, make profiles model, create relationship (user has one profile)
  # def show
  #   @user = User.find(params[:id])
  #   @profile = @user.profile
  # end

  def user_posts
    @user = current_user
    @posts = @user.posts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!
    @user.username.downcase!

    if @user.save
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      session[:user_id] = @user.id.to_s
      redirect_to posts_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a unique username, valid email and password. Then try again."
      render :new
    end
  end

  private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
