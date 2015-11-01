class CreateEventimages < ActiveRecord::Migration
  def change
    create_table :eventimages do |t|
      t.string :image_url
      t.integer :event_id
      t.string :image_type

      t.timestamps
    end
  end
end
