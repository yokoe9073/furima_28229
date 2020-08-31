class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :postal,       default: "", null:false
      t.integer :exhibitor_prefecture_id,  null:false
      t.string :city,         default: "", null:false
      t.string :address,      default: "", null:false
      t.string :building,     default: ""
      t.string :tel,          default: "", null:false
      t.references :order, foreign_key: true
      t.timestamps  
    end
  end
end
