class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :introduce
      t.string :image_id
      t.integer :price
      t.integer :genre_id
      t.integer :product_status, default: 0,  null: false
      t.boolean :delete_flag, default: false, null:false

      t.timestamps
    end
  end
end
