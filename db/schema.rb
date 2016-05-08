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

ActiveRecord::Schema.define(version: 20160508061442) do

  create_table "cars", force: :cascade do |t|
    t.datetime "createDate"
    t.datetime "modifiedDate"
    t.integer  "authorUserId"
    t.integer  "capacity"
    t.integer  "driverUserId"
    t.string   "title"
    t.integer  "trip_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "cars", ["trip_id"], name: "index_cars_on_trip_id"

  create_table "expenses", force: :cascade do |t|
    t.datetime "createDate"
    t.datetime "modifiedDate"
    t.integer  "authorUserId"
    t.float    "cost"
    t.integer  "payeeUserId"
    t.string   "title"
    t.integer  "trip_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "expenses", ["trip_id"], name: "index_expenses_on_trip_id"

  create_table "items", force: :cascade do |t|
    t.datetime "createDate"
    t.datetime "modifiedDate"
    t.integer  "authorUserId"
    t.integer  "categoryId"
    t.boolean  "required"
    t.string   "title"
    t.integer  "trip_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "items", ["trip_id"], name: "index_items_on_trip_id"

  create_table "trips", force: :cascade do |t|
    t.string   "title"
    t.datetime "createDate"
    t.datetime "modifiedDate"
    t.integer  "authorUserId"
    t.integer  "capacity"
    t.float    "cost"
    t.string   "description"
    t.datetime "endDate"
    t.integer  "hostUserId"
    t.string   "image"
    t.string   "location"
    t.boolean  "public"
    t.datetime "startDate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
