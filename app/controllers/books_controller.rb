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
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # ２. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # ３. トップ画面へリダイレクト
    redirect_to books_path

  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)

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
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

    def user_params
    params.require(:user).permit(:name, :profile_image, :body)
  end

end

