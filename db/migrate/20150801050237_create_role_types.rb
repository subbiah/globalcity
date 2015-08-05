class CreateRoleTypes < ActiveRecord::Migration
  def change
    create_table :role_types do |t|
      t.string :membertype
      t.string :activeflag

      t.timestamps
    end
  end
end
