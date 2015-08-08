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

ActiveRecord::Schema.define(version: 20150801195937) do

  create_table "association_masters", force: true do |t|
    t.string   "associationname"
    t.integer  "township_id"
    t.string   "address1"
    t.string   "address2"
    t.integer  "locationcode"
    t.integer  "citycode"
    t.integer  "districcode"
    t.integer  "statecode"
    t.integer  "countrycode"
    t.integer  "pincode"
    t.string   "activeflag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "building_masters", force: true do |t|
    t.integer  "buildinname"
    t.integer  "society_id"
    t.integer  "flatno"
    t.string   "flattype"
    t.string   "activeflag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gclife_registration_flatdetails", force: true do |t|
    t.integer  "user_id"
    t.integer  "gclife_registration_id"
    t.integer  "societyid"
    t.integer  "buildingid"
    t.integer  "ownertypeid"
    t.integer  "membertypeid"
    t.integer  "relationshipid"
    t.date     "tenurestart"
    t.date     "tenureend"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gclife_registrations", force: true do |t|
    t.integer  "user_id"
    t.integer  "mobileno"
    t.string   "fullname"
    t.string   "gender"
    t.date     "dob"
    t.integer  "emergencycontact"
    t.string   "occupation"
    t.string   "address1"
    t.string   "address2"
    t.integer  "locationcode"
    t.integer  "statecode"
    t.string   "countrycode"
    t.string   "pincode"
    t.string   "activeflag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_types", force: true do |t|
    t.string   "membertype"
    t.string   "activeflag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_types", force: true do |t|
    t.string   "membertype"
    t.string   "activeflag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "society_masters", force: true do |t|
    t.string   "societyname"
    t.integer  "association_id"
    t.string   "address1"
    t.string   "address2"
    t.integer  "locationcode"
    t.integer  "citycode"
    t.integer  "districcode"
    t.integer  "statecode"
    t.integer  "countrycode"
    t.integer  "pincode"
    t.string   "activeflag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "society_member_masters", force: true do |t|
    t.integer  "society_id"
    t.integer  "gclife_id"
    t.string   "fullname"
    t.integer  "building_id"
    t.integer  "mobileno"
    t.string   "ownertype"
    t.string   "membertyper"
    t.string   "activeflag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "township_masters", force: true do |t|
    t.string   "townshipname"
    t.string   "activeflag"
    t.string   "address1"
    t.string   "address2"
    t.integer  "locationcode"
    t.integer  "citycode"
    t.integer  "districtcode"
    t.integer  "satecode"
    t.integer  "countrycode"
    t.integer  "pincode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "otp"
    t.string   "otpflag"
    t.string   "active"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
