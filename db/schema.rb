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

ActiveRecord::Schema.define(version: 20150421000532) do

  create_table "customers", force: :cascade do |t|
    t.string   "company"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax1"
    t.string   "fax2"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.integer  "customer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "projects", ["customer_id"], name: "index_projects_on_customer_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "task_name"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"

  create_table "timeentries", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "task_id"
    t.float    "duration"
    t.datetime "start_time"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "timeentries", ["project_id"], name: "index_timeentries_on_project_id"
  add_index "timeentries", ["task_id"], name: "index_timeentries_on_task_id"
  add_index "timeentries", ["user_id"], name: "index_timeentries_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "display_name"
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
