class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.string :subject
      t.string :sender_name
      t.string :receiver_name
      t.text :message
      t.string :read

      t.timestamps
    end
  end
end
