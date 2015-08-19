class CreateSocietyMemberMasters < ActiveRecord::Migration
  def change
    create_table :society_member_masters do |t|
      t.integer :society_master_id
      t.integer :gclife_id
      t.integer :flat_id
      t.string  :fullname
      t.integer :building_master_id
      t.string :mobileno
      t.string :ownertype
      t.string :membertyper
      t.string :activeflag

      t.timestamps
    end
  end
end
