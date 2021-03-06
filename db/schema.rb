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

ActiveRecord::Schema.define(version: 2021_03_03_132424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "alternative_type_filters", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # Schema
  create_table "alternatives", force: :cascade do |t|
    t.bigint "product_id"
    t.string "title"
    t.text "description"
    t.text "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "find"
    t.string "imgUrl", default: ""
    t.bigint "alternative_type_filter_id"
    t.index ["alternative_type_filter_id"], name: "index_alternatives_on_alternative_type_filter_id"
    t.index ["product_id"], name: "index_alternatives_on_product_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "suggested_alternatives", force: :cascade do |t|
    t.bigint "product_id"
    t.string "title"
    t.text "description"
    t.text "source"
    t.text "find"
    t.string "imgUrl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "alternative_type_filter_id"
    t.index ["alternative_type_filter_id"], name: "index_suggested_alternatives_on_alternative_type_filter_id"
    t.index ["product_id"], name: "index_suggested_alternatives_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_role", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alternatives", "alternative_type_filters"
  add_foreign_key "alternatives", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "suggested_alternatives", "alternative_type_filters"
  add_foreign_key "suggested_alternatives", "products"
end
