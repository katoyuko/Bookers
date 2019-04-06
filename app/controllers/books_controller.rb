class BooksController < ApplicationController

  def top
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    # 全てのデータを取り出す
    @books = Book.all
    # 空のモデルをビューへ渡す
    @book = Book.new
  end

  def create
    # ストロングパラメーターを使用
    book = Book.new(book_params)
    # DBへ保存
    book.save
    # トップ画面へリダイレクト
    redirect_to "/books"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
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
