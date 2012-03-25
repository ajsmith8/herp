class Topic < ActiveRecord::Migration
  def up
    create_table :topics do |t|
      t.string :description
      t.string :url
      t.integer :score
      t.boolean :is_anon
      t.boolean :ispro
      t.integer :user_id
      t.string :content
      t.string :pro_fieldname
      t.string :con_fieldname
      t.integer :display_count
      t.integer :clicks
      t.integer :ancestry_depth
      t.string :ancestry
      t.timestamps
    end
  end

  def down
  end
end
