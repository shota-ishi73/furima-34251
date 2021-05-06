class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :item_name
    validates :item_text
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_payment_id
      validates :prefecture_id
      validates :delivery_day_id
    end
    validates :price, inclusion: { in: 300..9_999_999 }, numericality: true
    validates :image
  end

  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_payment
  belongs_to :prefecture
  belongs_to :delivery_day

end

