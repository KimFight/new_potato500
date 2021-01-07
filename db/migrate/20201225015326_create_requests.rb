class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :user,    null: false,  foreign_key: true
      t.text       :request,  null: false

      t.timestamps
    end
  end
end