class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.integer :category
      t.string :details
      t.integer :price 
      t.integer :status
      t.integer :delivery_fee
      t.integer :exhibitor_prefectures
      t.integer :shipping_date
      t.references :user, foreign_key: true 
      t.integer :category_id
      t.integer :status_id
      t.integer :delivery_fee_id
      t.timestamps
      
    end
  end
end
