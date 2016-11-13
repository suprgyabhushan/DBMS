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

ActiveRecord::Schema.define(version: 20161113204332) do

  create_table "collaborators", force: :cascade do |t|
    t.string   "company",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "collaborators", ["user_id"], name: "index_collaborators_on_user_id", using: :btree

  create_table "domains", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "emp_id",       limit: 255
    t.boolean  "ip_committee"
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "faculties", ["user_id"], name: "index_faculties_on_user_id", using: :btree

  create_table "ip_comms", force: :cascade do |t|
    t.integer  "vote",       limit: 4
    t.integer  "faculty_id", limit: 4
    t.integer  "ip_id",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "ip_comms", ["faculty_id"], name: "index_ip_comms_on_faculty_id", using: :btree
  add_index "ip_comms", ["ip_id"], name: "index_ip_comms_on_ip_id", using: :btree

  create_table "ips", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "identify_id", limit: 255
    t.integer  "status",      limit: 4
    t.string   "type",        limit: 255
    t.integer  "domain_id",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "ips", ["domain_id"], name: "index_ips_on_domain_id", using: :btree

  create_table "stakes", force: :cascade do |t|
    t.float    "percentage", limit: 24
    t.integer  "user_id",    limit: 4
    t.integer  "ip_id",      limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "stakes", ["ip_id"], name: "index_stakes_on_ip_id", using: :btree
  add_index "stakes", ["user_id"], name: "index_stakes_on_user_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "rollNumber", limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.boolean  "admin"
    t.float    "royalty_credited",       limit: 24
    t.float    "royalty_accumulated",    limit: 24
    t.string   "name",                   limit: 255
    t.string   "type",                   limit: 255
    t.integer  "status",                 limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "collaborators", "users"
  add_foreign_key "faculties", "users"
  add_foreign_key "ip_comms", "faculties"
  add_foreign_key "ip_comms", "ips"
  add_foreign_key "ips", "domains"
  add_foreign_key "stakes", "ips"
  add_foreign_key "stakes", "users"
  add_foreign_key "students", "users"
end
