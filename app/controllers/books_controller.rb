class BooksController < ApplicationController

  def index
    @books = Book.all
    @hon = Book.new
  end

  def create
    @hon = Book.new(book_params)
    if @hon.save
      redirect_to books_path
    else
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to show_book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end
