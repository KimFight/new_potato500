class AddPurchasesToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :item, foreign_key: true
  end
end
