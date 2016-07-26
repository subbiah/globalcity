class AddBillAmountPaidToBillStatus < ActiveRecord::Migration
  def change
  	add_column :bill_statuses, :bill_amount_paid, :integer
  end
end
