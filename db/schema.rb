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

ActiveRecord::Schema.define(version: 20180321211139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_badges_on_unit_id"
  end

  create_table "earned_badges", force: :cascade do |t|
    t.datetime "earned_at"
    t.bigint "badge_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quiz_submission_id"
    t.index ["badge_id"], name: "index_earned_badges_on_badge_id"
    t.index ["quiz_submission_id"], name: "index_earned_badges_on_quiz_submission_id"
    t.index ["user_id"], name: "index_earned_badges_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_text"
    t.jsonb "answers"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_questions_on_unit_id"
  end

  create_table "quiz_submissions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "unit_id"
    t.jsonb "answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_quiz_submissions_on_unit_id"
    t.index ["user_id"], name: "index_quiz_submissions_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "time_estimate"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "pronoun"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_image_url"
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "badges", "units"
  add_foreign_key "earned_badges", "badges"
  add_foreign_key "earned_badges", "quiz_submissions"
  add_foreign_key "earned_badges", "users"
  add_foreign_key "questions", "units"
  add_foreign_key "quiz_submissions", "units"
  add_foreign_key "quiz_submissions", "users"
end
