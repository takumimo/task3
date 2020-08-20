class UsersController < ApplicationController
  

  

  def show
  	@book = Book.new
  	@books = Book.all
    @user = User.find(params[:id])
  
  end

  

   def index
   end

   def new
   	
   end

   def edit
    @user = User.find(params[:id])
   end



  

end
