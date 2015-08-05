class CreateGclifeRegistrationFlatdetails < ActiveRecord::Migration
  def change
    create_table :gclife_registration_flatdetails do |t|
      t.integer :gclife_registration_id
      t.integer :societyid
      t.integer :buildingid
      t.integer :ownertypeid
      t.integer :membertypeid
      t.integer :relationshipid
      t.date :tenurestart
      t.date :tenureend

      t.timestamps
    end
  end
end
