class Addusernametoevents < ActiveRecord::Migration
  def change
  	add_column :events, :username, :string
  end
end
