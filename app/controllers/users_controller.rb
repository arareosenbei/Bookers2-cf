class UsersController < ApplicationController
before_action :authenticate_user!



    def index
        @book = Book.new
        @users = User.all
        @user = current_user
    end

    def create
        @book = Book.new(user_params)
        user = current_user
        @book = user.book
        if @book.save
            flash[:success] = "You have created book successfully."
            redirect_to book_path(@book)
        else
            @books = Book.all
            render 'index'
        end
    end

    def show
        @book_new = Book.new
        @user = User.find(params[:id])
        @books = @user.books

    end

    def edit
        @user = User.find(params[:id])
        if @user.id != current_user.id
            redirect_to user_path(current_user)
        end
    end
    

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "You have updated user successfully."
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end


    private
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end


end
