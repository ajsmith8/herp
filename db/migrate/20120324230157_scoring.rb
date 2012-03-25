class Scoring < ActiveRecord::Migration
  def up
    create_table :scorings do |t|
      t.integer :topic_id
      t.integer :user_id
      t.integer :vote
      t.timestamps
    end
  end

  def down
  end
end
