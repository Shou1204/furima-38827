class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_one :purchase

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[!-~]{6,}+\z/, message: '半角英数字混合での入力が必要です' }
  validates :nickname, presence: true
  validates :first_name_kanji, presence: true,
                               format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: '漢字・ひらがな・カタカナのみ使用できます' }
  validates :family_name_kanji, presence: true,
                                format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: '漢字・ひらがな・カタカナのみ使用できます' }
  validates :first_name_kana, presence: true, format: { with: /\A\p{katakana}+\z/, message: 'カタカナのみ使用できます' }
  validates :family_name_kana, presence: true, format: { with: /\A\p{katakana}+\z/, message: 'カタカナのみ使用できます' }
  validates :birthday, presence: true
end
