class Item < ApplicationRecord
  has_one :purchase

  with_options presence: true do
      validates :name
      validates :introduction
      validates :price
    end

end
