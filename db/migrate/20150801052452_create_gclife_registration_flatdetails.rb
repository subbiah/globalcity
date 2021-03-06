class CreateGclifeRegistrationFlatdetails < ActiveRecord::Migration
  def change
    create_table :gclife_registration_flatdetails do |t|
      t.integer :user_id
      t.integer :gclife_registration_id
      t.string :societyid
      t.string :buildingid
      t.string :ownertypeid
      t.string :membertypeid
      t.string :member_type
      t.string :relationshipid
      t.string :avenue_name
      t.string :flat_number
      t.string :flat_type
      t.date :tenurestart
      t.date :tenureend

      t.timestamps
    end
  end
end
