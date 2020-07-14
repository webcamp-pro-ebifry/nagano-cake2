class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :user_id
      # 2択なのでbooleanでいじる
      t.boolean :payment_method ,null: false , default: false
      t.integer :postage, default: 800,  null: false
      t.integer :payment
      t.integer :status　,default: 0,  null: false
      t.string :address
      # userの方はpostal_codeになっているので注意
      t.string :postcode

      t.string :name

      t.timestamps
    end
  end
end
