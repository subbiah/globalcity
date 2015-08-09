class CreateGclifeRegistrationFlatdetails < ActiveRecord::Migration
  def change
    create_table :gclife_registration_flatdetails do |t|
      t.integer :user_id
      t.integer :gclife_registration_id
      t.string :societyid
      t.string :buildingid
      t.string :ownertypeid
      t.string :membertypeid
      t.string :relationshipid
      t.date :tenurestart
      t.date :tenureend

      t.timestamps
    end
  end
end
