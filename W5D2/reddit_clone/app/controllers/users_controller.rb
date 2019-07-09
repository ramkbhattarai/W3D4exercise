class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # debugger
    @user = User.new(user_params)
    # debugger
    if @user.save
      log_in(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
      params.require(:user).permit(:username, :password)
    end

end
