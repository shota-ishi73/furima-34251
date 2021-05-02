class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, length: {minimum:6},format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "は英数字混合にしてください"}
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "must include @" }
  with_options presence: true do
    validates :nickname
    validates :first_name,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は漢字・平仮名・カタカナにしてください"}
    validates :last_name,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は漢字・平仮名・カタカナにしてください"}
    validates :first_name_kana,format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナにしてください"}
    validates :last_name_kana,format: {with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナにしてください"}
    validates :birth_day
  end

  has_many :items, dependent: :destroy

end