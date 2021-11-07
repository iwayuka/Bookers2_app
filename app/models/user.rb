class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #association => Book
  has_many :books, dependent: :destroy
  attachment :profile_image

  # バリテーション の記述（USERないでは「name」に付与）
  validates :name, presence: true
  # 以上


end
