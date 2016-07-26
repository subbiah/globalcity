class AddassociationlistToEvents < ActiveRecord::Migration
  def change
  	add_column :users, :association_list, :text
  	add_column :users, :society_list, :text
  	add_column :users, :member_type_list, :text
  end
end
