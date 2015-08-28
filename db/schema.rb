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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150828095539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "cards", force: true do |t|
    t.string   "native"
    t.string   "translit"
    t.string   "translat"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "okubo_decks", force: true do |t|
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "okubo_decks", ["user_id", "user_type"], name: "index_okubo_decks_on_user_id_and_user_type", using: :btree

  create_table "okubo_items", force: true do |t|
    t.integer  "deck_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "box",           default: 0
    t.datetime "last_reviewed"
    t.datetime "next_review"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "times_right",   default: 0
    t.integer  "times_wrong",   default: 0
  end

  add_index "okubo_items", ["source_id", "source_type"], name: "index_okubo_items_on_source_id_and_source_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: true do |t|
    t.string   "native"
    t.string   "translit"
    t.string   "translat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "sentence"
    t.text     "sent_trans"
  end

  add_index "words", ["user_id"], name: "index_user_id", using: :btree

end
