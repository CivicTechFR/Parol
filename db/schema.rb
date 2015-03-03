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

ActiveRecord::Schema.define(version: 20150303112002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amendments", force: :cascade do |t|
    t.string   "chamber"
    t.string   "author"
    t.string   "amendment_number"
    t.text     "content"
    t.text     "object"
    t.date     "date"
    t.string   "status"
    t.integer  "law_article_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "amendments", ["law_article_id"], name: "index_amendments_on_law_article_id", using: :btree

  create_table "code_articles", force: :cascade do |t|
    t.string   "article_number"
    t.text     "content"
    t.string   "code"
    t.string   "part"
    t.string   "sub_part"
    t.string   "book"
    t.string   "title"
    t.string   "chapter"
    t.string   "section"
    t.string   "sub_section"
    t.string   "paragraph"
    t.string   "article"
    t.integer  "code_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "code_articles", ["code_id"], name: "index_code_articles_on_code_id", using: :btree

  create_table "codes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "github_path"
  end

  create_table "law_articles", force: :cascade do |t|
    t.string   "article_number"
    t.string   "content"
    t.string   "object"
    t.string   "status"
    t.integer  "law_id"
    t.integer  "code_article_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "law_articles", ["code_article_id"], name: "index_law_articles_on_code_article_id", using: :btree
  add_index "law_articles", ["law_id"], name: "index_law_articles_on_law_id", using: :btree

  create_table "laws", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "amendments", "law_articles"
  add_foreign_key "code_articles", "codes"
  add_foreign_key "law_articles", "code_articles"
  add_foreign_key "law_articles", "laws"
end
