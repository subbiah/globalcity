class CreateImportantContacts < ActiveRecord::Migration
  def change
    create_table :important_contacts do |t|
      t.string :name
      t.string :phno
      t.string :email

      t.timestamps
    end
  end
end
