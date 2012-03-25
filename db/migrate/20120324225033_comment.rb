class Comment < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :score
      t.integer :user_id
      t.boolean :is_anon
      t.boolean :ispro
      t.text :content
      t.integer :topic_id
      t.timestamps
    end
  end

  def down
  end
end
