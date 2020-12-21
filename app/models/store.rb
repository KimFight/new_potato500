class Store < ApplicationRecord
  belongs_to       :user
  has_many_attached :images
  has_many         :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  # いいね機能

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to  :prefecture

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :images
    validates :city
    validates :store_name
    validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: "is invalid."}
    validates :address 
    validates :close_day
    validates :open_time
    validates :close_time  
    validates :content_500
    validates :introduction 
  end

end
