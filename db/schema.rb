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

ActiveRecord::Schema.define(version: 20200224164333) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "counselor_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "appointments", ["counselor_id"], name: "index_appointments_on_counselor_id"
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id"

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "support_group_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "attendances", ["support_group_id"], name: "index_attendances_on_support_group_id"
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id"

  create_table "counselors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "specialty"
    t.text     "desc"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "support_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "location"
    t.time     "time"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "support_groups", ["user_id"], name: "index_support_groups_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
