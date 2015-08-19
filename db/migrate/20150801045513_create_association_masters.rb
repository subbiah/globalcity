class CreateAssociationMasters < ActiveRecord::Migration
  def change
    create_table :association_masters do |t|
      t.string :associationname
      t.integer :township_master_id
      t.string :address1
      t.string :address2
      t.integer :locationcode
      t.integer :citycode
      t.integer :districcode
      t.integer :statecode
      t.integer :countrycode
      t.integer :pincode
      t.string :activeflag

      t.timestamps
    end
  end
end
