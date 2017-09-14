class AddCategoryToImportantContact < ActiveRecord::Migration
  def change
    add_column :important_contacts, :category, :string
  end
end
