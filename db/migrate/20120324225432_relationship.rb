class Relationship < ActiveRecord::Migration
  def up
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :follower_id      
      t.timestamps
    end
  end

  def down
  end
end
