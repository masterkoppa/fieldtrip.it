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

ActiveRecord::Schema.define(version: 20140625053838) do

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
    t.datetime "start"
    t.datetime "end"
    t.integer  "employee_id"
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
    t.integer "employee_id"
    t.integer "event_id"
  end

  create_table "employee_field_trips", force: true do |t|
    t.integer "employee_id"
    t.integer "field_trip_id"
    t.boolean "attending"
    t.boolean "responded"
  end

  create_table "employee_preferences", force: true do |t|
    t.boolean  "preference"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "employee_id"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
    t.string   "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true
  add_index "employees", ["invitation_token"], name: "index_employees_on_invitation_token", unique: true
  add_index "employees", ["invitations_count"], name: "index_employees_on_invitations_count"
  add_index "employees", ["invited_by_id"], name: "index_employees_on_invited_by_id"
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true

  create_table "employees_groups", force: true do |t|
    t.integer "employee_id"
    t.integer "group_id"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "capacity"
    t.integer  "field_trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sub_event"
  end

  create_table "field_trips", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.integer "event_id"
    t.integer "field_trip_id"
  end

end
