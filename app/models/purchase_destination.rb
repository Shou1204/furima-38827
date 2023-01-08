class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :address, :building, :phone_number, :purchase_id, :user_id, :item_id, :token,
                :destination_id, :price

  with_options presence: true do
    validates :city
    validates :address
    validates :prefecture_id, numericality: { other_than: 1, message: '発送元の地域を選んでください' }
    validates :user_id
    validates :item_id
    validates :phone_number
    validates :post
    # validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: '発送元の地域を選んでください' }
  validates :phone_number, format: { with: /\A[0-9]{10}$|^[0-9]{11}\z/, message: '電話番号は10桁から11桁で入力してください' }
  validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: '郵便番号は「ハイフン(-)」を含めた正しい形式でご入力ください' }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Destination.create(post: post, prefecture_id: prefecture_id, city: city, address: address, building: building,
                       phone_number: phone_number, purchase_id: purchase.id)
  end
end
