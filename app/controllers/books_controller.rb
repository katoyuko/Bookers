class BooksController < ApplicationController

  def top
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    # 全てのデータをIDの若い順に取り出す
    @books = Book.all.order(created_at: :desc)
    # 空のモデルをビューへ渡す
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book), notice: "Book was successfully created."
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book), notice: "Book was successfully updated."
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:Title, :Body)
  end
end
