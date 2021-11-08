class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #association => Book
  has_many :books, dependent: :destroy
  attachment :profile_image

  # バリテーション の記述
  # 「name」のバリテーションは、一意性かつ2〜20文字の入力に設定
  validates :name, presence: true, uniqueness: true,
                   length: { minimum: 2, maximum: 20 }
  # 「introduction」のバリテーションは、最大50文字
  validates :introduction, length: { maximum: 50 }


  # 以上


end
