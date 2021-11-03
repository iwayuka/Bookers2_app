class BooksController < ApplicationController

  def index
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成。
    @book = Book.new

  end

  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to '/'
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
