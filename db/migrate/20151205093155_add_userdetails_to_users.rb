class AddUserdetailsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :privacy, :bool
  	add_column :users, :gender, :string
  	add_column :users, :dob, :string
  	add_column :users, :emergency_contct_no, :string
  	add_column :users, :occupation, :string
  end
end
