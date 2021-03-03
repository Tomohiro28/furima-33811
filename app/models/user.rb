class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :email,                 uniqueness: true
  validates :password,              presence: true,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  validates :password_confirmation, presence: true,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}  
  validates :nickname,              presence: true
  validates :last_name,             presence: true
  validates :first_name,            presence: true
  validates :birthday,              presence: true
  validates :last_hurigana,         presence: true
  validates :first_hurigana,        presence: true
end
