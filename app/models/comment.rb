class Comment < ApplicationRecord
  belongs_to :store
  belongs_to :user
  has_one_attached :comment_image
  

  validates :comment, presence: true, length: { maximum: 30 }
end
