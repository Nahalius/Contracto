# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151011092016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreemnts", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "client_id"
    t.decimal  "amount"
    t.decimal  "budget_hours"
    t.string   "manager"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "agreemnt_type"
    t.boolean  "closed"
  end

  add_index "agreemnts", ["client_id", "name", "created_at"], name: "index_agreemnts_on_client_id_and_name_and_created_at", using: :btree
  add_index "agreemnts", ["client_id"], name: "index_agreemnts_on_client_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "manager"
    t.string   "eik"
    t.string   "postcode"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clients", ["company_id", "created_at"], name: "index_clients_on_company_id_and_created_at", using: :btree
  add_index "clients", ["company_id"], name: "index_clients_on_company_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "eik"
    t.string   "address"
    t.string   "manager"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "client"
    t.string   "phone"
    t.string   "mail"
    t.string   "other"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["company_id", "created_at"], name: "index_contacts_on_company_id_and_created_at", using: :btree
  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id", using: :btree

  create_table "invoices", force: true do |t|
    t.string   "number"
    t.date     "date"
    t.integer  "agreemnt_id"
    t.decimal  "amount"
    t.string   "manager"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["agreemnt_id", "number", "created_at"], name: "index_invoices_on_agreemnt_id_and_number_and_created_at", using: :btree
  add_index "invoices", ["agreemnt_id"], name: "index_invoices_on_agreemnt_id", using: :btree

  create_table "payments", force: true do |t|
    t.date     "date"
    t.integer  "agreemnt_id"
    t.decimal  "amount"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["agreemnt_id", "created_at"], name: "index_payments_on_agreemnt_id_and_created_at", using: :btree
  add_index "payments", ["agreemnt_id"], name: "index_payments_on_agreemnt_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "question"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "section"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["company_id", "name", "section", "created_at"], name: "index_surveys_on_company_id_and_name_and_section_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "diplom"
    t.string   "signature"
    t.decimal  "hour_rate"
    t.integer  "company_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
