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

ActiveRecord::Schema.define(version: 20160220194623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id",    null: false
    t.integer  "recipient_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "interest_users", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "interest_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "match_restaurants", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.integer  "restaurant_id",                 null: false
    t.boolean  "match",         default: false
    t.boolean  "is_permanent",  default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "match_users", force: :cascade do |t|
    t.integer  "creator_id",                 null: false
    t.integer  "target_id",                  null: false
    t.string   "status",                     null: false
    t.boolean  "accepted",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id", null: false
    t.integer  "match_user_id",   null: false
    t.integer  "sender_id",       null: false
    t.integer  "recipient_id",    null: false
    t.string   "content",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "address",        null: false
    t.string   "average_rating", null: false
    t.string   "cuisine",        null: false
    t.string   "image_url",      null: false
    t.string   "phone",          null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "swipes", force: :cascade do |t|
    t.integer  "swiper_id",     null: false
    t.integer  "swipee_id",     null: false
    t.boolean  "direction",     null: false
    t.integer  "restaurant_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "password_digest"
    t.string   "age"
    t.string   "image"
    t.text     "background_information"
    t.boolean  "is_desperate",           default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

end
