class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :order

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください' }
    validates :furi_first_n, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
    validates :furi_last_n, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
    validates :email, format: { with: /@.+/, message: 'は"@"を含めて入力してください' }
    validates :password, format: { with:/\A[a-zA-Z0-9]+\z/i, message: 'は半角英数字を使用してください' }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英字と数字を両方使用してください' }
    validates :password_confirmation
    validates :birthday, presence: { message: 'を入力してください' }
  end
end
