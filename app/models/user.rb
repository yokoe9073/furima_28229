class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :comments
  has_many :buyer

 with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'}
    validates :last_name, format: { with:/\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください'}
    validates :furi_first_n, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい'}
    validates :furi_last_n,format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい'}
    validates :email,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i ,'半角英数字どちらも使用して下さい'}
    validates :password,format: { with: /\A(?=.*?[a-z])(?=*?[\d])[a-z\d]{6,}+\z/i, '半数英数字を使用して下さい'}
    
  end
end

