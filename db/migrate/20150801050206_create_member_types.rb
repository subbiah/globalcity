class CreateMemberTypes < ActiveRecord::Migration
  def change
    create_table :member_types do |t|
      t.string :membertype
      t.string :activeflag

      t.timestamps
    end
  end
end
