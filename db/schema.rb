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

ActiveRecord::Schema[7.0].define(version: 2023_02_21_123946) do
  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.integer "theatre_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["movie_id"], name: "index_customers_on_movie_id"
    t.index ["theatre_id"], name: "index_customers_on_theatre_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "theatre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theatre_id"], name: "index_employees_on_theatre_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "screen_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["screen_id"], name: "index_movies_on_screen_id"
  end

  create_table "screens", force: :cascade do |t|
    t.integer "screen_id"
    t.integer "theatre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theatre_id"], name: "index_screens_on_theatre_id"
  end

  create_table "theatres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "customers", "movies"
  add_foreign_key "customers", "theatres"
  add_foreign_key "employees", "theatres"
  add_foreign_key "movies", "screens"
  add_foreign_key "screens", "theatres"
end
