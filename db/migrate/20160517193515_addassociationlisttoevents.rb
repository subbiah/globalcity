class Addassociationlisttoevents < ActiveRecord::Migration
  def change
  	add_column :events, :association_list, :text
  	add_column :events, :society_list, :text
  	add_column :events, :member_type_list, :text
  end
end
