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

ActiveRecord::Schema.define(version: 20171105043015) do

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "customer_id"
    t.integer  "pack_id"
    t.integer  "no_of_pack"
    t.decimal  "amount",      precision: 10
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.decimal  "amount_paid", precision: 10
    t.index ["customer_id"], name: "index_bookings_on_customer_id", using: :btree
    t.index ["pack_id"], name: "index_bookings_on_pack_id", using: :btree
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "contact_number"
    t.string   "ref"
    t.string   "booking_status"
    t.datetime "last_contacted"
    t.decimal  "amount_pending",            precision: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "no_of_cars"
    t.string   "address"
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "contact_number"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "address"
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
  end

  create_table "packs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.decimal  "amount",             precision: 10
    t.integer  "no_of_appointments"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "customer_id"
    t.integer  "booking_id"
    t.integer  "pack_id"
    t.integer  "employee_id"
    t.datetime "appointment"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "status",      default: false
    t.index ["booking_id"], name: "index_schedules_on_booking_id", using: :btree
    t.index ["customer_id"], name: "index_schedules_on_customer_id", using: :btree
    t.index ["employee_id"], name: "index_schedules_on_employee_id", using: :btree
    t.index ["pack_id"], name: "index_schedules_on_pack_id", using: :btree
  end

  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "packs"
  add_foreign_key "schedules", "bookings"
  add_foreign_key "schedules", "customers"
  add_foreign_key "schedules", "employees"
  add_foreign_key "schedules", "packs"
end
