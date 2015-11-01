class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :sdesc
      t.string :bdesc
      t.string :event_type
      t.integer :user_id
      t.integer :association_id
      t.integer :society_id

      t.timestamps
    end
  end
end
