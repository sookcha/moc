class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.string :url
			t.integer :user_id

      t.timestamps
    end
  end
end
