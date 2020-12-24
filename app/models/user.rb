class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true

  has_one  :store
  has_many :comments
  has_many :purchases


  # いいね機能
  has_many :favorites, dependent: :destroy

  def already_favorited?(store)
    self.favorites.exists?(store_id: store.id)
  end

end
