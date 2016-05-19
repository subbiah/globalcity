class CreateFacilitatorSocietyMasters < ActiveRecord::Migration
  def change
    create_table :facilitator_society_masters do |t|
      t.string :society_id
      t.string :category
      t.string :facilitatorname
      t.integer :mobilenumber
      t.integer :mobilenumber2
      t.string :emailid
      t.string :location
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :activeflag
      t.string :createdby

      t.timestamps
    end
  end
end
