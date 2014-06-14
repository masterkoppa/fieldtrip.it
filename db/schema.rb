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

ActiveRecord::Schema.define(version: 20140614223314) do

  create_table "addresses", force: true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", unique: true

  create_table "availabilities", force: true do |t|
    t.time     "start"
    t.time     "end"
    t.integer  "employees_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_events", force: true do |t|
    t.boolean "attending"
    t.integer "employees_id"
    t.integer "events_id"
  end

  create_table "employee_field_trips", force: true do |t|
    t.integer "employees_id"
    t.integer "field_trips_id"
  end

  create_table "employee_preferences", force: true do |t|
    t.boolean  "preference"
    t.integer  "events_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "companies_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "capacity"
    t.integer  "field_trips_id"
    t.string   "type"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_trips", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "companies_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
