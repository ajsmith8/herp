class User < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :url
      t.string :city
      t.string :state
      t.string :gender
      t.integer :age
      t.string :encrypted_password
      t.string :salt
      t.string :name
      t.string :email
      t.boolean :admin
      t.timestamps
    end
  end

  def down
  end
end
