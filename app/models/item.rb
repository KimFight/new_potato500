class Item < ApplicationRecord
  has_one :purchase
  has_one_attached :item_image

  with_options presence: true do
      validates :name
      validates :introduction
      validates :price
      validates :item_image
    end

end
