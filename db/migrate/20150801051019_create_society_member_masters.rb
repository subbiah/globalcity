class CreateSocietyMemberMasters < ActiveRecord::Migration
  def change
    create_table :society_member_masters do |t|
      t.integer :society_id
      t.integer :gclife_id
      t.string :fullname
      t.integer :building_id
      t.integer :mobileno
      t.string :ownertype
      t.string :membertyper
      t.string :activeflag

      t.timestamps
    end
  end
end
