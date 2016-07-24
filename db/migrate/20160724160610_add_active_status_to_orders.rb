class AddActiveStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :active_status, :string
  end
end
