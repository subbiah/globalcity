class CreateTownshipMasters < ActiveRecord::Migration
  def change
    create_table :township_masters do |t|
      t.string :townshipname
      t.string :activeflag
      t.string :address1
      t.string :address2
      t.integer :locationcode
      t.integer :citycode
      t.integer :districtcode
      t.integer :satecode
      t.integer :countrycode
      t.integer :pincode

      t.timestamps
    end
  end
end
