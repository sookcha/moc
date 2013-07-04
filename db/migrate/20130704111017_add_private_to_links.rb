class AddPrivateToLinks < ActiveRecord::Migration
  def change
    add_column :links, :private, :boolean
  end
end
