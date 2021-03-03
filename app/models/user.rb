class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name,      format: {with: /\A[ぁ-んァ-ン一-龥々]/}
    validates :first_name,     format: {with: /\A[ぁ-んァ-ン一-龥々]/}
    validates :birthday
    validates :last_hurigana,  format: {with: /\A[ァ-ヶー－]+\z/}
    validates :first_hurigana, format: {with: /\A[ァ-ヶー－]+\z/}
  end
  with_options presence: true,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/} do
    validates :password
    validates :password_confirmation  
  end
    validates :email,                 uniqueness: true
end
