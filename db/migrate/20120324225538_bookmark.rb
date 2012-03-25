class Bookmark < ActiveRecord::Migration
  def up
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :topic_id
      t.timestamps
    end
  end

  def down
  end
end
