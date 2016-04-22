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

ActiveRecord::Schema.define(version: 20160422021056) do

  create_table "clocks", force: :cascade do |t|
    t.datetime "date"
    t.integer  "employee_id"
    t.string   "evaluation"
    t.integer  "moment_id"
    t.integer  "diference"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "clocks", ["employee_id"], name: "index_clocks_on_employee_id"
  add_index "clocks", ["moment_id"], name: "index_clocks_on_moment_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.time     "arrival_time"
    t.time     "departure_time"
    t.integer  "tolerance"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mail"
    t.date     "birth"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id"

  create_table "moments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end