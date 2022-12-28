class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :ship_date
  belongs_to :shipping_charge
  has_one_attached :image
  belongs_to :user

  validates :name,                presence: true
  validates :details,             presence: true
  validates :price,               presence: true,
                                  numericality: { greater_than: 299, less_than: 10_000_000, message: '¥300~¥9,999,999の範囲でご入力ください'}
  validates :price,               numericality: { only_integer: true, message: '整数でご入力ください'}
  validates :category_id,         presence: true, numericality: { other_than: 1, message: 'カテゴリーを選んでください' }
  validates :condition_id,        presence: true, numericality: { other_than: 1, message: '商品の状態を選んでください' }
  validates :shipping_charge_id,  presence: true, numericality: { other_than: 1, message: '配送料の負担を選んでください' }
  validates :prefecture_id,       presence: true, numericality: { other_than: 1, message: '発送元の地域を選んでください' }
  validates :ship_date_id,        presence: true, numericality: { other_than: 1, message: '発送までの日数を選んでください' }

  validates :image, attached: true
end
