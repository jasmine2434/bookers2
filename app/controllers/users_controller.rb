class UsersController < ApplicationController

   def create
    @book = Book.new(book_params)
    #@book.user_id = current_user.id
    #@book.save
   # redirect_to books_path
   end


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    
    
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path
    #@user.update(user_params)
    #redirect_to books_path
      else
    render :edit
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
