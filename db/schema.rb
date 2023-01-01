# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_31_115457) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

<<<<<<< HEAD
  create_table "departments", primary_key: "uuid", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
=======
  create_table "departments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
>>>>>>> 57168a50e9aacf0b7a8b3a9c184f69bd6738c326
    t.text "name", null: false
    t.integer "floor", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "employee_places", primary_key: "uuid", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "employee_id"
    t.uuid "department_id"
    t.uuid "programming_language_id"
  end

  create_table "employees", primary_key: "uuid", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
=======
  create_table "employee_places", force: :cascade do |t|
    t.uuid "uuid"
    t.uuid "employee_id", null: false
    t.uuid "department_id", null: false
    t.uuid "programming_language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employee_places_on_department_id"
    t.index ["employee_id"], name: "index_employee_places_on_employee_id"
    t.index ["programming_language_id"], name: "index_employee_places_on_programming_language_id"
  end

  create_table "employees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
>>>>>>> 57168a50e9aacf0b7a8b3a9c184f69bd6738c326
    t.text "name", null: false
    t.text "surname", null: false
    t.integer "age", null: false
    t.text "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "programming_languages", primary_key: "uuid", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
=======
  create_table "programming_languages", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
>>>>>>> 57168a50e9aacf0b7a8b3a9c184f69bd6738c326
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  add_foreign_key "employee_places", "departments", primary_key: "uuid"
  add_foreign_key "employee_places", "employees", primary_key: "uuid"
  add_foreign_key "employee_places", "programming_languages", primary_key: "uuid"
=======
  add_foreign_key "employee_places", "departments"
  add_foreign_key "employee_places", "employees"
  add_foreign_key "employee_places", "programming_languages"
>>>>>>> 57168a50e9aacf0b7a8b3a9c184f69bd6738c326
end
