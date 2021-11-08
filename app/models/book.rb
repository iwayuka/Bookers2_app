class Book < ApplicationRecord

  #association => User
  belongs_to :user

  # バリテーション の記述（BOOKでは「title」「body」に付与。かつ「body」には最大２００文字に設定）
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  # 以上

end
