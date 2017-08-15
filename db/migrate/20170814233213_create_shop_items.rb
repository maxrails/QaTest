class CreateShopItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_items do |t|
      t.string :name
      t.string :img
      t.string :item_type, index: true

      t.timestamps
    end
  end
end
