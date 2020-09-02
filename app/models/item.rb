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
  validates :unless: :was_attached?
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :exhibitor_prefecture_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  def was_attached?
    self.image.attached?
  end
end
