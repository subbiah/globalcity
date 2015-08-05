class CreateGclifeRegistrations < ActiveRecord::Migration
  def change
    create_table :gclife_registrations do |t|
      t.integer :user_id
      t.integer :mobileno
      t.string :fullname
      t.string :gender
      t.date :dob
      t.integer :emergencycontact
      t.string :occupation
      t.string :address1
      t.string :address2
      t.integer :locationcode
      t.integer :statecode
      t.string :countrycode
      t.string :pincode
      t.string :activeflag

      t.timestamps
    end
  end
end
