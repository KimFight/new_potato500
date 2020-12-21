class Comment < ApplicationRecord
  belongs_to :store
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 30 }
end
