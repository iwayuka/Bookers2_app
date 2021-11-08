class BooksController < ApplicationController
  # deviseを使った時に、ログイン中のユーザー情報を取得する記述
  before_action :authenticate_user!

  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def create
    # データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 投稿ユーザーidにはカレントユーザーidを自動的に保存する
    @book.user_id = current_user.id
    # データをデータベースに保存するためのsaveメソッド実行
    # かつ、バリテーション の実行
    if @book.save
      # トップ画面へリダイレクトから投稿した詳細画面へリダイレクトに記述の変更
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      # データベースの保存の実行ができなかった場合、「今の画面」へ戻る
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @booknew = Book.new

  end

  def edit
    @book = Book.find(params[:id])
    # URLを直接入力しても、投稿ユーザーとカレントユーザーが同じで無ければ、編集できないようにする記述
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
    # 以上

  end

  def update
    @book = Book.find(params[:id])
    # バリテーション の実行
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end



  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end

