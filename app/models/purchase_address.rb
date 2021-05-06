class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :address, :prefecture_id, :city, :city_text, :city_building, :tell

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :address, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン付きで000-0000の形式で入力してください'}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :city_text
    validates :tell, length: {maximum:11}, numericality: {only_integer: true}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(address: address, prefecture_id: prefecture_id, city: city, city_text: city_text,city_building: city_building,tell: tell, purchase_id: purchase.id)
  end
end
