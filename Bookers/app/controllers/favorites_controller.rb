class FavoritesController < ApplicationController
	before_action :set_book

	def create
	    favorite = @book.favorites.new(user_id: current_user.id)
	    favorite.save
	end

	def destroy
	    favorite = current_user.favorites.find_by(book_id: @book.id)
	    favorite.destroy
	end

	private
	def set_book
		@book = Book.find(params[:book_id])
	end
end
