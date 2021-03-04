class BooksController < ApplicationController
  before_action :check_user, only: [:edit, :update]

  def check_user
    book=Book.find(params[:id])
    unless book.user == current_user
      redirect_to books_path
    end
  end

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
    @book_comment=BookComment.new
    @newbook=Book.new
    @user=User.find(@book.user_id)
    @follow_user=User.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
       flash[:success] = "You have updated book successfully"
       redirect_to book_path(@book.id)
    else
      render :edit
    end
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
