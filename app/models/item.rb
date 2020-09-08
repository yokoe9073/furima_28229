class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :exhibitor_prefecture
  belongs_to_active_hash :shipping_date
  # ジャンルの選択が「--」の時は保存できないようにする

  belongs_to :user
  has_many :comments
  has_one :order
  has_one_attached :image

  validates :name, :detail, :category, :status, :delivery_fee, :exhibitor_prefecture, :shipping_date, :price, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :image, presence: {message: 'を選択してください'}
  validates :status_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :delivery_fee_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :exhibitor_prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :shipping_date_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300~9,999,999の間で入力してください' }
  validates :price, presence: { message: 'を入力してください' }

end
