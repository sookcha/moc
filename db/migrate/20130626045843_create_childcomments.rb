class CreateChildcomments < ActiveRecord::Migration
  def change
    create_table :childcomments do |t|
      t.string :author
      t.string :body
      t.references :comment

      t.timestamps
    end
  end
end
