class Tag < ActiveRecord::Migration
  def up
    create_table :tags do |t|
      t.string :url
      t.integer :topic_id
      t.string :content
      t.timestamps
    end
  end

  def down
  end
end
