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

ActiveRecord::Schema.define(version: 20160128191737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.integer  "band_id"
    t.string   "title",                      null: false
    t.boolean  "live",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["title"], name: "index_albums_on_title", using: :btree

  create_table "bands", force: :cascade do |t|
    t.string   "band_name",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bands", ["band_name"], name: "index_bands_on_band_name", unique: true, using: :btree

  create_table "tracks", force: :cascade do |t|
    t.integer  "album_id"
    t.string   "title",                      null: false
    t.boolean  "bonus",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["title"], name: "index_tracks_on_title", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree

end
