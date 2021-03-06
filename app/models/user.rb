class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nike_name
    validates :barth_day
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は6文字以上で半角英数字をそれぞれ含めてください' }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/,message: 'に全角文字を使用してください' } do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ヴ]+\z/,message: 'に全角カナを使用してください' } do
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
  end

has_many :items
has_many :orders

end

