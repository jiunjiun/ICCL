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

ActiveRecord::Schema.define(version: 20131117133039) do

  create_table "banners", force: true do |t|
    t.string   "name"
    t.string   "file"
    t.string   "size"
    t.string   "content_type"
    t.integer  "index",        default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "news", force: true do |t|
    t.integer  "status",                 default: 1
    t.string   "title",      limit: 100
    t.text     "content"
    t.integer  "line"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "papers", force: true do |t|
    t.string   "_type",      limit: 2
    t.integer  "year"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.integer  "status",                 default: 1
    t.string   "title",      limit: 100
    t.text     "content"
    t.integer  "line"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "studies", force: true do |t|
    t.string   "classes"
    t.string   "title",      limit: 100
    t.text     "content"
    t.integer  "line"
    t.integer  "status",                 default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "role",       limit: 2,  default: "GU"
    t.string   "fb_id",      limit: 30
    t.string   "classes"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

end
