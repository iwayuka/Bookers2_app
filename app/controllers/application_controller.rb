class ApplicationController < ActionController::Base
  # ログインしていない状況では、ログイン画面に移動するように指定の記述
  before_action :authenticate_user!
  # 以上

  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン、ログイン後の遷移先の指定
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  # 以上


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
end
