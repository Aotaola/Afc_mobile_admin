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

ActiveRecord::Schema[7.0].define(version: 2023_10_27_193443) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "body"
    t.string "photo"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_articles_on_admin_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "description"
    t.float "total_amount"
    t.float "copayment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_invoices_on_patient_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "article_id"
    t.bigint "service_id"
    t.string "action"
    t.string "article_title"
    t.string "admin_name"
    t.string "service_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_logs_on_admin_id"
    t.index ["article_id"], name: "index_logs_on_article_id"
    t.index ["service_id"], name: "index_logs_on_service_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "insurance"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "admins"
  add_foreign_key "invoices", "patients", on_delete: :nullify
  add_foreign_key "logs", "admins", on_delete: :nullify
  add_foreign_key "logs", "articles", on_delete: :nullify
  add_foreign_key "logs", "services", on_delete: :nullify
end
