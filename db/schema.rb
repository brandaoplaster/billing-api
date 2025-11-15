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

ActiveRecord::Schema[8.0].define(version: 2025_11_14_175645) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "charges", force: :cascade do |t|
    t.bigint "payment_plan_id", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.date "due_date", null: false
    t.integer "payment_method", null: false
    t.integer "status", default: 0, null: false
    t.string "payment_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["due_date"], name: "index_charges_on_due_date"
    t.index ["payment_code"], name: "index_charges_on_payment_code", unique: true
    t.index ["payment_plan_id"], name: "index_charges_on_payment_plan_id"
    t.index ["status"], name: "index_charges_on_status"
  end

  create_table "cost_centers", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cost_centers_on_name", unique: true
  end

  create_table "financial_guardians", force: :cascade do |t|
    t.string "name", null: false
    t.string "cpf", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_financial_guardians_on_cpf", unique: true
  end

  create_table "payment_plans", force: :cascade do |t|
    t.bigint "financial_guardian_id", null: false
    t.bigint "cost_center_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cost_center_id"], name: "index_payment_plans_on_cost_center_id"
    t.index ["financial_guardian_id", "cost_center_id"], name: "index_payment_plans_on_guardian_and_cost_center", unique: true
    t.index ["financial_guardian_id"], name: "index_payment_plans_on_financial_guardian_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "charge_id", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.date "payment_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_id"], name: "index_payments_on_charge_id"
    t.index ["payment_date"], name: "index_payments_on_payment_date"
  end

  add_foreign_key "charges", "payment_plans"
  add_foreign_key "payment_plans", "cost_centers"
  add_foreign_key "payment_plans", "financial_guardians"
  add_foreign_key "payments", "charges"
end
