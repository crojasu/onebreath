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

ActiveRecord::Schema.define(version: 2018_06_05_100759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.bigint "preset_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "chosen"
    t.index ["preset_id"], name: "index_activities_on_preset_id"
  end

  create_table "breaks", force: :cascade do |t|
    t.bigint "timer_session_id"
    t.bigint "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "length"
    t.index ["activity_id"], name: "index_breaks_on_activity_id"
    t.index ["timer_session_id"], name: "index_breaks_on_timer_session_id"
  end

  create_table "presets", force: :cascade do |t|
    t.integer "working_day"
    t.integer "focus_timer"
    t.bigint "user_id"
    t.integer "break_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_presets_on_user_id"
  end

  create_table "statistics", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.bigint "timer_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timer_session_id"], name: "index_statistics_on_timer_session_id"
  end

  create_table "stats", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.bigint "timer_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timer_session_id"], name: "index_stats_on_timer_session_id"
  end

  create_table "timer_sessions", force: :cascade do |t|
    t.bigint "preset_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preset_id"], name: "index_timer_sessions_on_preset_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "presets"
  add_foreign_key "breaks", "activities"
  add_foreign_key "breaks", "timer_sessions"
  add_foreign_key "presets", "users"
  add_foreign_key "statistics", "timer_sessions"
  add_foreign_key "stats", "timer_sessions"
  add_foreign_key "timer_sessions", "presets"
end
