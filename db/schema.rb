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

ActiveRecord::Schema.define(version: 2018_12_08_191239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mails", force: :cascade do |t|
    t.string "title"
    t.text "message"
    t.date "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "to_id"
    t.integer "from_id"
    t.index ["from_id"], name: "index_mails_on_from_id"
    t.index ["to_id"], name: "index_mails_on_to_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "sender"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_notifications_on_teacher_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "subjects_id"
    t.datetime "time"
    t.integer "teacher_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_schedules_on_student_id"
    t.index ["subjects_id"], name: "index_schedules_on_subjects_id"
    t.index ["teacher_id"], name: "index_schedules_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.string "course"
    t.integer "group"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "time"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "user_id"
    t.string "university"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.integer "age"
    t.string "token"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "to_emails_id"
    t.integer "from_emails_id"
    t.index ["from_emails_id"], name: "index_users_on_from_emails_id"
    t.index ["to_emails_id"], name: "index_users_on_to_emails_id"
  end

end
