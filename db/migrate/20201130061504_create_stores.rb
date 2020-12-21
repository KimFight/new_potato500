class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string      :store_name,      null: false
      t.string      :postal_code,     null: false
      t.integer     :prefecture_id,   null: false
      t.string      :city,            null: false
      t.string      :phone_number,    null: false
      t.string      :close_day,       null: false
      t.time        :open_time,       null: false
      t.time        :close_time,      null: false
      t.string      :content_500,     null: false
      t.string      :introduction,    null: false
      t.string      :address,         null: false
      t.string      :building_name

      t.timestamps
    end
  end
end
