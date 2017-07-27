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

ActiveRecord::Schema.define(version: 20170727093017) do

  create_table "contents", force: :cascade do |t|
    t.text     "ct"
    t.integer  "floor"
    t.integer  "post_id"
    t.integer  "user_id"
    t.time     "last_reply_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["post_id"], name: "index_contents_on_post_id"
    t.index ["user_id", "created_at", "post_id"], name: "index_contents_on_user_id_and_created_at_and_post_id"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "mps", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_mps_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_mps_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "subject"
    t.integer  "content_count"
    t.integer  "user_id"
    t.time     "reply_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id", "updated_at"], name: "index_posts_on_user_id_and_updated_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "session_ids", force: :cascade do |t|
    t.string   "s_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "online"
  end

  create_table "urls", force: :cascade do |t|
    t.string   "url"
    t.string   "user_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.boolean  "admin",             default: false
    t.boolean  "online"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "last_reply"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
