class AddSocietyMasterIdToBuildingMasters < ActiveRecord::Migration
  def change
  	add_column :building_masters, :society_master_id, :integer
  end
end
