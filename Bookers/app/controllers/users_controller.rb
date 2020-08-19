class UsersController < ApplicationController
  

  

  def show
  	@book = Book.new
  	@books = Book.all
  
  end

  def create
  	@book = Book.new(book_params)
  	@book.save
  	redirect_to users_path(current_user.id)
  end

   def index
   end

   def new
   	
   end

   



  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end

end
