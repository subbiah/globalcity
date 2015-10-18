class AddStatusToFlatDetails < ActiveRecord::Migration
  def change
  	add_column :gclife_registration_flatdetails, :status, :string
  end
end
