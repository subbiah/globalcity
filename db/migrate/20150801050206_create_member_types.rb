class CreateMemberTypes < ActiveRecord::Migration
  def change
    create_table :member_types do |t|
      t.string :member_type
      t.string :activeflag
      t.integer :priority
      t.integer :user_id
      
      t.timestamps
    end
  end
end
