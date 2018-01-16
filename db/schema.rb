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

ActiveRecord::Schema.define(version: 20171030114835) do

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "contact_number"
    t.string   "alternate_number"
    t.string   "profession"
    t.string   "experience"
    t.string   "enterprise"
    t.integer  "age"
    t.string   "sex"
    t.string   "refferal_type"
    t.string   "refferal"
    t.string   "executive"
    t.string   "email"
    t.string   "vehicle_kind"
    t.string   "vehicle_no"
    t.string   "vehicle_brand"
    t.string   "vehicle_model"
    t.string   "vehicle_color"
    t.string   "vehicle_gear_type"
    t.string   "vehicle_no_of_gears"
    t.string   "vehicle_other"
    t.string   "cab_name"
    t.string   "cab_agent"
    t.string   "cab_rate"
    t.string   "cab_total_distance"
    t.string   "cab_total_fare"
    t.string   "cab_kind"
    t.string   "cab_no"
    t.string   "cab_brand"
    t.string   "cab_model"
    t.string   "cab_color"
    t.string   "cab_gear_type"
    t.string   "cab_no_of_gears"
    t.string   "home_address"
    t.string   "office_address"
    t.string   "location"
    t.string   "current_provider"
    t.string   "requirement"
    t.string   "remarks"
    t.string   "review"
    t.string   "rating"
    t.string   "suggestions"
    t.string   "insights"
    t.string   "to_do"
    t.string   "last_communication"
    t.string   "call_back"
    t.string   "status"
    t.string   "discounts"
    t.decimal  "amount_pending",      precision: 10
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
