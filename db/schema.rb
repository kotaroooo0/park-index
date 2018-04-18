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

ActiveRecord::Schema.define(version: 20180417164447) do

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "park_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "like_count", default: 0
    t.index ["park_id"], name: "index_comments_on_park_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lanes", force: :cascade do |t|
    t.string "name"
    t.text "items"
    t.integer "park_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["park_id"], name: "index_lanes_on_park_id"
    t.index ["user_id"], name: "index_lanes_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.integer "comment_count", default: 0
    t.integer "area_id"
    t.integer "skiresort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.text "description"
    t.index ["area_id"], name: "index_parks_on_area_id"
    t.index ["skiresort_id"], name: "index_parks_on_skiresort_id"
  end

  create_table "skiresorts", force: :cascade do |t|
    t.string "name"
    t.string "prefecture"
    t.integer "area_id"
    t.integer "park_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sas_url"
    t.string "picture"
    t.text "description"
    t.index ["area_id"], name: "index_skiresorts_on_area_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "gender"
    t.integer "area_id"
    t.string "image"
    t.integer "comment_count", default: 0
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "self_introduction"
    t.string "home_gelaende"
    t.index ["area_id"], name: "index_users_on_area_id"
  end

end
