class LoginsController < ApplicationController
  def new
    return redirect_to root_path if @current_user.present?
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Te-ai logat cu succes!"
      
    else
      flash[:alert] = "Email sau parola gresita"
      render :new, status: :unprocessable_entity
    end
  end

  private 
    def login_params
      params.require(:user).permit(:email, :password)
    end
end
