class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name, :nil => false
      t.string :author, :nil => false
      t.text :description, :nil => false

      t.timestamps
    end
  end
end
