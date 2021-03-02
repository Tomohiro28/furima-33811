class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :email,                 uniqueness: true
  validates :password,              confirmation: true
  validates :password_confirmation, presence: true  
  validates :nickname,              presence: true
  validates :last_name,             presence: true
  validates :first_name,            presence: true
  validates :birthday,              presence: true
  validates :last_hurigana,         presence: true
  validates :first_hurigana,        presence: true
end
