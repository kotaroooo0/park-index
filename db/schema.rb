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

ActiveRecord::Schema.define(version: 20180204145256) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "park_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_comments_on_park_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.integer "item"
    t.string "level"
    t.integer "skiresort_id"
    t.integer "comment_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "area"
    t.string "picture"
  end

  create_table "skiresorts", force: :cascade do |t|
    t.string "name"
    t.string "prefecture"
    t.integer "area"
    t.integer "park_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sas_url"
    t.string "picture"
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "gender"
    t.integer "area"
    t.string "image"
    t.integer "comment_count", default: 0
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "self_introduction"
    t.string "home_gelaende"
  end

end
