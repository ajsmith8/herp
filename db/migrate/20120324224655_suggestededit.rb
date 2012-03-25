class Suggestededit < ActiveRecord::Migration
  def up
    create_table :suggestededits do |t|
      t.text :existing_content
      t.string :url
      t.text :suggestion
      t.integer :topic_id
      t.string :ancestry
      t.integer :user_id
      t.timestamps
    end
  end

  def down
  end
end