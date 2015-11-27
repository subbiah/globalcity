class Add < ActiveRecord::Migration
  def change
  	add_column :events, :member_type, :string
  	add_column :events, :association_name, :string
  	add_column :events, :society_name, :string
  end
end
