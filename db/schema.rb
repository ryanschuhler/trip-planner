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

ActiveRecord::Schema.define(version: 20160525030101) do

  create_table "cars", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "author_id"
    t.integer  "capacity"
    t.integer  "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cars", ["author_id"], name: "index_cars_on_author_id"
  add_index "cars", ["driver_id"], name: "index_cars_on_driver_id"
  add_index "cars", ["trip_id"], name: "index_cars_on_trip_id"

  create_table "expenses", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "member_id"
    t.integer  "author_id"
    t.float    "cost"
    t.string   "title"
    t.integer  "payee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "expenses", ["author_id"], name: "index_expenses_on_author_id"
  add_index "expenses", ["member_id"], name: "index_expenses_on_member_id"
  add_index "expenses", ["payee_id"], name: "index_expenses_on_payee_id"
  add_index "expenses", ["trip_id"], name: "index_expenses_on_trip_id"

  create_table "items", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "author_id"
    t.integer  "categoryId"
    t.boolean  "required"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["author_id"], name: "index_items_on_author_id"
  add_index "items", ["trip_id"], name: "index_items_on_trip_id"

  create_table "members", force: :cascade do |t|
    t.integer  "trip_id"
    t.boolean  "admin"
    t.string   "email"
    t.integer  "status"
    t.integer  "inviter_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["inviter_id"], name: "index_members_on_inviter_id"
  add_index "members", ["trip_id"], name: "index_members_on_trip_id"
  add_index "members", ["user_id"], name: "index_members_on_user_id"

  create_table "trips", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "capacity"
    t.float    "cost"
    t.string   "description"
    t.string   "displayConfiguration"
    t.datetime "endDate"
    t.string   "image"
    t.string   "location"
    t.boolean  "public"
    t.datetime "startDate"
    t.string   "title"
    t.integer  "host_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "trips", ["author_id"], name: "index_trips_on_author_id"
  add_index "trips", ["host_id"], name: "index_trips_on_host_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
