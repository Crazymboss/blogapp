class PostaresController < ApplicationController

  def index
    @postares = Postare.joins(:user).all
  end
  def show
    @postare = Postare.find(params[:id])
    render :show
  end
  def new
    @postare = Postare.new
  end 
  def create
    @postare = Postare.new(post_params)
    if @postare.save
      redirect_to root_path, notice: "Postare creata cu succes!"
    else
      flash[:alert] = "Postarea nu a fost creata, te rog incearca din nou!"
    end
  end


  def edit
    @postare = Postare.find(params[:id])
  end

  def update
    @postare = Postare.find(post_update_params[:id])
    if @postare.update(post_update_params)
      flash[:notice] = "Postare editata cu succes!"
       redirect_to root_path
    else
      flash[:alert] = "Postarea nu a putut si editata!"
      render :edit
    end
  end

  

  def destroy
  end


  private 

  def post_params
    params.require(:postare).permit(:title, :description).merge(user_id: @current_user.id)
  end

  def post_update_params
    params.require(:postare).permit(:id, :title, :description).merge(user_id: @current_user.id)
  end
end
