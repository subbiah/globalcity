class AddColumnNameToBillStatus < ActiveRecord::Migration
  def change
    add_column :bill_statuses, :payment_mode, :string
    add_column :bill_statuses, :ref_no, :string
  end
end
