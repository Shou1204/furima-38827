class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :address, :building, :phone_number, :purchase_id, :user_id, :item_id

  # with_options presence: true do
  #   validates :post
  #   validates :city
  #   validates :address
  #   validates :address
  #   validates :phone_number
  #   validates :purchase_id
  # end
  # validates :prefecture, numericality: { other_than: 1, message: '発送元の地域を選んでください' }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Destination.create(post: post, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: item_id)
  end
end