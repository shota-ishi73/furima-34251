class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :item_text
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_payment_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :delivery_day_id, numericality: { other_than: 1 }
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/, message:"は半角数字にしてください"}
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_payment
  belongs_to :prefecture
  belongs_to :delivery_day

end

