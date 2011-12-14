class AddTitleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :title, :string
    remove_column :books, :name
  end
end
