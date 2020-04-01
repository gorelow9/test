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

ActiveRecord::Schema.define(version: 2020_03_31_083517) do

  create_table "bounds", force: :cascade do |t|
    t.integer "department_id"
    t.integer "employee_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_bounds_on_department_id"
    t.index ["employee_id"], name: "index_bounds_on_employee_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "department_id"
    t.integer "employee_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_connections_on_department_id"
    t.index ["employee_id"], name: "index_connections_on_employee_id"
  end

  create_table "departments", force: :cascade do |t|
    t.date "foundation"
    t.date "disbandment"
    t.string "names"
    t.string "current_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "FIO"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
