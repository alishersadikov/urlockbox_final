class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome to UrLockbox!"
      redirect_to :root
    else
      flash[:danger] = "This email has been used!" if User.find_by(email: user.email)
      flash[:danger] = "Password mismatch!" if user.password != user.password_confirmation
      redirect_to :signup
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
