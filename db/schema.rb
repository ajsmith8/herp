# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120324230157) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.boolean  "is_anon"
    t.boolean  "ispro"
    t.text     "content"
    t.integer  "topic_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "commentscorings", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "comment_id"
    t.integer  "user_id"
    t.integer  "vote"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "scorings", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.integer  "vote"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "suggestededits", :force => true do |t|
    t.text     "existing_content"
    t.string   "url"
    t.text     "suggestion"
    t.integer  "topic_id"
    t.string   "ancestry"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "url"
    t.integer  "topic_id"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "description"
    t.string   "url"
    t.integer  "score"
    t.boolean  "is_anon"
    t.boolean  "ispro"
    t.integer  "user_id"
    t.string   "content"
    t.string   "pro_fieldname"
    t.string   "con_fieldname"
    t.integer  "display_count"
    t.integer  "clicks"
    t.integer  "ancestry_depth"
    t.string   "ancestry"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "url"
    t.string   "city"
    t.string   "state"
    t.string   "gender"
    t.integer  "age"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "name"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
