class CreateEventComments < ActiveRecord::Migration
  def change
    create_table :event_comments do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :username
      t.text :comment

      t.timestamps
    end
  end
end
