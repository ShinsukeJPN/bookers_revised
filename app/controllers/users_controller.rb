class UsersController < ApplicationController
	before_action :list_page, only: [:show, :index, :edit]
	def show
	end

	def index
		@users = User.all
	end

	def edit
		@user_image = User.find(current_user.id)
	end

	def update
		@user_image = User.find(current_user.id)
		@user_image = @user_image.update(user_image_params)
		redirect_to user_path
	end

	private
		def user_image_params
			params.require(:user).permit(:name, :image, :introduction)

		end

		def list_page
			@user = current_user
			@book = Book.new
		end

end
