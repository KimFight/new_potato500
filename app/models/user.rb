class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  has_one  :store
  has_many :comments

  has_many :favorites, dependent: :destroy
  # いいね機能

  def already_favorited?(store)
    self.favorites.exists?(store_id: store.id)
  end

  validates :nickname, presence: true

end
