class BooksController < ApplicationController
  # deviseを使った時に、ログイン中のユーザー情報を取得する記述
  before_action :authenticate_user!

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)

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

  def update
  end

  def destroy

  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end

