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

ActiveRecord::Schema.define(version: 20170209004210) do

  create_table "entries", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "author"
    t.string   "contributor"
    t.string   "dc_creator"
    t.string   "pubDate"
    t.string   "published"
    t.string   "dc_date"
    t.text     "description"
    t.text     "summary"
    t.text     "content"
    t.text     "content_encoded"
    t.string   "media_content_url"
    t.string   "media_title"
    t.string   "media_thumbnail_url"
    t.string   "guid"
    t.integer  "feed_id"
    t.text     "preview_html"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "entries", ["feed_id"], name: "index_entries_on_feed_id"
  add_index "entries", ["guid"], name: "index_entries_on_guid", unique: true

  create_table "feeds", force: true do |t|
    t.text     "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
