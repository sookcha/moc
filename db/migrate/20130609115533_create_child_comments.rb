class CreateChildComments < ActiveRecord::Migration
  def change
    create_table :child_comments do |t|
      t.string :author
      t.string :body
      t.references :comment

      t.timestamps
    end
    add_index :child_comments, :comment_id
  end
end
