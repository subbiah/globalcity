class Addcolumstomessages < ActiveRecord::Migration
  def change
  	add_column :messages, :from_user_delete_flag, :bool
  	add_column :messages, :to_user_delete_flag, :bool
  end
end
