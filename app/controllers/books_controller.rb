class BooksController < ApplicationController

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @user=current_user
    @books=Book.all
    if @book.save
      flash[:success] = "You have created book successfully"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @book=Book.new
    @books=Book.all
    @user=current_user
  end

  def show
    @book=Book.find(params[:id])
    @newbook=Book.new
    @user=current_user
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    @book.update(book_params)
    flash[:success] = "You have updated book successfully"
    redirect_to book_path(@book.id)
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
