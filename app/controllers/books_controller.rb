class BooksController < ApplicationController
	before_action :correct_user, only: [:edit]
	before_action :list_page, only: [:index]

	def new
		@book = Book.new
	end

	def index
		@books = Book.all
		@users = User.all
	end

	def show
		@book = Book.find(params[:id])
		@newbook = Book.new
		@user = current_user
	end

	def create
		book = Book.new(book_params)
		book.user_id = current_user.id
		if book.save
		redirect_to book_path(book.id)
		else
			@books = Book.all
			@book = book
			@users = User.all
			@user = current_user
			render 'index'
		end
	end

	def edit
		@book = Book.find(params[:id])
		@user = current_user
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to book_path(@book.id)
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :review)
	end

	def correct_user
		@book = Book.find(params[:id])
		unless current_user == @book.user
		redirect_to books_path
		end
	end


	def list_page
		@user = current_user
		@book = Book.new
	end

end