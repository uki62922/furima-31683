class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :items
 has_many :orders
 has_many :comment

 with_options presence: true do
   validates :nick_name
   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
   validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
   validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
   validates :birth
   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  end


end
