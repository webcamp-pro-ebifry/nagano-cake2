class RenameStatusColumnToOrders < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders, :status　, :status
  end
end
