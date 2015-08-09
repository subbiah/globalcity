class CreateRoleTypes < ActiveRecord::Migration
  def change
    create_table :role_types do |t|
      t.string :role_type
      t.string :activeflag
	  t.integer :priority
	  t.integer :user_id
      
      t.timestamps
    end
  end
end
