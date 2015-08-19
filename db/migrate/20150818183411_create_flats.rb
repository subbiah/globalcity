class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :flat
      t.string :flat_types
      t.integer :building_master_id
      t.integer :active_flag

      t.timestamps
    end
  end
end
