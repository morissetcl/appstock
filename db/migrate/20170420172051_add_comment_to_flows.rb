class AddCommentToFlows < ActiveRecord::Migration[5.0]
  def change
    add_column :flows, :comment, :string
  end
end
