class UsersController < ApplicationController



  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    # ユーザーが投稿したデータのみを取得する記述 (※使用の際は、gem「kaminari」をインストールすること)
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # バリテーション の実行
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
