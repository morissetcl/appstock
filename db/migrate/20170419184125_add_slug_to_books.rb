class AddSlugToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :slug, :isbn
    add_index :books, :slug, unique: true
  end
end
