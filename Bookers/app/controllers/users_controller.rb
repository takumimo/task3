class UsersController < ApplicationController
  

  

  def show
  	@book = Book.new
  	@books = Book.all
    @user = User.find(params[:id])
  
  end

  

   def index
    @users = User.all
   end

   def new
   	
   end

   def edit
    @user = User.find(params[:id])
   end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
   end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
