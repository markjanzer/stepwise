# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_28_232420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "passions", force: :cascade do |t|
    t.string "goals"
    t.string "vision"
    t.string "name"
  end

  create_table "reminders", force: :cascade do |t|
    t.date "trigger_at"
    t.boolean "is_active", default: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "passion_id"
    t.integer "timeframe_id"
    t.string "description"
    t.datetime "completed_at"
    t.boolean "is_current", default: false
  end

  create_table "time_frames", force: :cascade do |t|
    t.string "name"
  end

  create_table "todos", force: :cascade do |t|
    t.date "date"
  end

end
