class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
    else
        @users = User.all
        @books = Book.all
        @user = current_user
        render :index
    #@book.save
   # redirect_to books_path
    end
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    #book.update(book_params)
    #redirect_to book_path
    else
    render :edit
    end
  end

  def edit
    @book = Book.find(params[:id])
    #@user = User.find(params[:id])
    #if @user == current_user
      #render :edit
    #else
      #redirect_to users_path(current_user)
    #end
  end

  def destroy
    book = Book.find(params[:id])

    book.destroy
    redirect_to books_path

  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
