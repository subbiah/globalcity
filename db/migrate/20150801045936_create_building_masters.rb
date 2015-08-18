class CreateBuildingMasters < ActiveRecord::Migration
  def change
    create_table :building_masters do |t|
      t.string :buildinname
      t.integer :society_id
      t.integer :flatno
      t.string :flattype
      t.string :activeflag

      t.timestamps
    end
  end
end
