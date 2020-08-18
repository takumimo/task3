class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
	end

	def create
	end

	def index
		@books = Book.all
	end

	def show
	end

	

end
