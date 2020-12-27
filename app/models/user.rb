class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nike_name, presence: true
PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/ 
validates_format_of :password, with: PASSWORD_REGEX 


has_many :items
has_many :orders

end

# パスワードは、半角英数字混合での入力が必須であること