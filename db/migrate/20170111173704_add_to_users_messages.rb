class AddToUsersMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :to_users, :text
  	change_column :messages, :subject, :text
  end
end
