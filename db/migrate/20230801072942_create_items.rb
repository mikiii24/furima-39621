class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name,                    null: false, default: ""
      t.text :item_info,                 null: false, default: nil
      t.integer :category_id,            null: false, default: nil
      t.integer :sales_status_id,        null: false, default: nil
      t.integer :shipping_fee_status_id, null: false, default: nil
      t.integer :prefecture_id,          null: false, default: nil
      t.integer :scheduled_delivery_id,  null: false, default: nil
      t.integer :price,                  null: false, default: nil
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
