class Book < ApplicationRecord

  #association => User
  belongs_to :user

  # バリテーション の記述（BOOKでは「title」「body」に付与）
  validates :title, presence: true
  validates :body, presence: true
  # 以上

end
