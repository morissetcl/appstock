class AddCommentToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :comment, :string
  end
end
