class RegistrationsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])
    redirect_to root_path if user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_login_path, notice: "User creat cu succes"
    else
      flash[:alert] = "User-ul nu a putut fi salvat"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
