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

ActiveRecord::Schema.define(version: 20150929172234) do

  create_table "association_masters", force: true do |t|
    t.string   "associationname"
    t.integer  "township_master_id"
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

  create_table "bill_statuses", force: true do |t|
    t.integer  "society_master_id"
    t.integer  "building_master_id"
    t.integer  "user_id"
    t.integer  "flat_id"
    t.integer  "bill_amt"
    t.string   "fy"
    t.string   "month"
    t.string   "status"
    t.string   "upload_status"
    t.string   "confirmed_status"
    t.string   "deletion_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "payment_mode"
    t.string   "ref_no"
  end

  create_table "building_masters", force: true do |t|
    t.string   "buildinname"
    t.integer  "society_id"
    t.integer  "flatno"
    t.string   "flattype"
    t.string   "activeflag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "society_master_id"
  end

  create_table "flats", force: true do |t|
    t.string   "flat"
    t.string   "flat_types"
    t.integer  "building_master_id"
    t.integer  "active_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gclife_registration_flatdetails", force: true do |t|
    t.integer  "user_id"
    t.integer  "gclife_registration_id"
    t.string   "societyid"
    t.string   "buildingid"
    t.string   "ownertypeid"
    t.string   "membertypeid"
    t.string   "member_type"
    t.string   "relationshipid"
    t.string   "avenue_name"
    t.string   "flat_number"
    t.string   "flat_type"
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

  create_table "images", force: true do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_types", force: true do |t|
    t.string   "member_type"
    t.string   "activeflag"
    t.integer  "priority"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_types", force: true do |t|
    t.string   "role_type"
    t.string   "activeflag"
    t.integer  "priority"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "society_masters", force: true do |t|
    t.string   "societyname"
    t.integer  "association_master_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "locationcode"
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
    t.integer  "society_master_id"
    t.integer  "gclife_id"
    t.integer  "flat_id"
    t.string   "fullname"
    t.integer  "building_master_id"
    t.string   "mobileno"
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
    t.string   "otp"
    t.string   "otpflag"
    t.string   "active"
    t.string   "mobile"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
