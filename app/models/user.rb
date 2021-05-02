class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, length: {minimum:6},format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "は英数字混合にしてください"}
  validates :nickname, presence: true, presence: {message:"can't be blank"} 
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "must include @" }
  validates :first_name, presence: true, presence: {message: "can't be blank"}
  validates :last_name, presence: true, presence: {message: "can't be blank"}
  validates :first_name_kana, presence: true, presence: {message: "can't be blank"}
  validates :last_name_kana, presence: true, presence: {message: "can't be blank"}
  validates :birth_day, presence: true, presence: {message: "can't be black"}
end