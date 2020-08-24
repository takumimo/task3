class BooksController < ApplicationController
  #before_action :logged_in_user, only: [:edit, :update]
	before_action :authenticate_user!
  #before_action :set_book
	def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
       flash[:notice] ="You have creatad book successfully."
  	 redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

	def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  #def set_book
   # @book = Book.find(params[:id])
   # redirect_to (user_url(current_user)) unless params[:id] == current_user.id
  #end

  def index
    #@user = User.find[:id]
    #@book = Book.new
    #@books = @user.books
    @books = Book.all
    @book = Book.new
    @user = current_user
    
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
         flash[:notice] = "You have updated book successfully."
         redirect_to book_path(@book.id)
      else
         render :edit
      end
  end

   def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

	private
  def book_params
  	params.require(:book).permit(:title,:body, :user_id)
  end

  #def logged_in_user
      #unless logged_in?
        #flash[:danger] = "Please log in."
        #redirect_to login_url
      #end
  #end

end
