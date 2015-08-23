class CreateBillStatuses < ActiveRecord::Migration
  def change
    create_table :bill_statuses do |t|
      t.integer :society_master_id
      t.integer :building_master_id
      t.integer :user_id
      t.integer :bill_amt
      t.string :fy
      t.string :month
      t.string :status
      t.string :upload_status
      t.string :deletion_flag

      t.timestamps
    end
  end
end
