class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :price ,null: false
      t.timestamps
    end
  end
end
