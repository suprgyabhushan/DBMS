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

<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 20161130175638) do
=======

ActiveRecord::Schema.define(version: 20161130060851) do

>>>>>>> Stashed changes

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "collaborators", force: :cascade do |t|
    t.string   "company",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "collaborators", ["user_id"], name: "index_collaborators_on_user_id", using: :btree

  create_table "domains", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "domains", ["name"], name: "index_domains_on_name", unique: true, using: :btree

  create_table "faculties", force: :cascade do |t|
    t.string   "emp_id",       limit: 255, null: false
    t.boolean  "ip_committee"
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "faculties", ["emp_id"], name: "index_faculties_on_emp_id", unique: true, using: :btree
  add_index "faculties", ["user_id"], name: "index_faculties_on_user_id", using: :btree

  create_table "ip_comms", force: :cascade do |t|
    t.integer  "vote",       limit: 4
    t.text     "comment",    limit: 65535
    t.integer  "faculty_id", limit: 4,     null: false
    t.integer  "ip_id",      limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "ip_comms", ["faculty_id", "ip_id"], name: "index_ip_comms_on_faculty_id_and_ip_id", unique: true, using: :btree
  add_index "ip_comms", ["faculty_id"], name: "index_ip_comms_on_faculty_id", using: :btree
  add_index "ip_comms", ["ip_id"], name: "index_ip_comms_on_ip_id", using: :btree

  create_table "ips", force: :cascade do |t|
    t.string   "title",       limit: 255,               null: false
    t.text     "description", limit: 65535,             null: false
    t.string   "identify_id", limit: 255
    t.integer  "domain_id",   limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "status",      limit: 4,     default: 0
    t.string   "role",        limit: 255
    t.string   "attachment",  limit: 255,               null: false
  end

  add_index "ips", ["domain_id"], name: "index_ips_on_domain_id", using: :btree
  add_index "ips", ["title", "attachment"], name: "index_ips_on_title_and_attachment", unique: true, using: :btree

  create_table "licences", force: :cascade do |t|
    t.string   "agreement",      limit: 255,             null: false
    t.float    "royalty_to_pay", limit: 24,              null: false
    t.datetime "end_time",                               null: false
    t.integer  "payment_type",   limit: 4,   default: 1, null: false
    t.integer  "licencee_id",    limit: 4,               null: false
    t.string   "licencee_type",  limit: 255,             null: false
    t.integer  "ip_id",          limit: 4,               null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "licences", ["ip_id"], name: "index_licences_on_ip_id", using: :btree
  add_index "licences", ["licencee_id", "licencee_type", "ip_id"], name: "index_licences_on_licencee_id_and_licencee_type_and_ip_id", unique: true, using: :btree
  add_index "licences", ["licencee_type", "licencee_id"], name: "index_licences_on_licencee_type_and_licencee_id", using: :btree
<<<<<<< Updated upstream
=======

  create_table "licences", force: :cascade do |t|
    t.string   "agreement",      limit: 255
    t.float    "royalty_to_pay", limit: 24
    t.datetime "end_time"
    t.integer  "payment_type",   limit: 4
    t.integer  "licencee_id",    limit: 4
    t.string   "licencee_type",  limit: 255
    t.integer  "ip_id",          limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "licences", ["ip_id"], name: "index_licences_on_ip_id", using: :btree
  add_index "licences", ["licencee_type", "licencee_id"], name: "index_licences_on_licencee_type_and_licencee_id", using: :btree
>>>>>>> Stashed changes

  create_table "organisations", force: :cascade do |t|
    t.string   "name",                limit: 255, null: false
    t.float    "royalty_accumulated", limit: 24
    t.float    "royalty_credited",    limit: 24
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "organisations", ["name"], name: "index_organisations_on_name", unique: true, using: :btree
  add_index "organisations", ["user_id"], name: "index_organisations_on_user_id", using: :btree

  create_table "stakes", force: :cascade do |t|


    t.string   "stakeholder_type", limit: 255
    t.float    "percentage",       limit: 24
    t.integer  "stakeholder_id",   limit: 4
    t.integer  "ip_id",            limit: 4


    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

<<<<<<< Updated upstream
  add_index "stakes", ["ip_id"], name: "index_stakes_on_ip_id", using: :btree
  add_index "stakes", ["stakeholder_id", "stakeholder_type", "ip_id"], name: "index_stakes_on_stakeholder_id_and_stakeholder_type_and_ip_id", unique: true, using: :btree
  add_index "stakes", ["stakeholder_id"], name: "index_stakes_on_stakeholder_id", using: :btree
=======

  add_index "stakes", ["stakeholder_id", "stakeholder_type", "ip_id"], name: "index_stakes_on_stakeholder_id_and_stakeholder_type_and_ip_id", unique: true, using: :btree
>>>>>>> Stashed changes

  create_table "students", force: :cascade do |t|
    t.string   "rollNumber", limit: 255, null: false
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "students", ["rollNumber"], name: "index_students_on_rollNumber", unique: true, using: :btree
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
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.boolean  "admin"
    t.float    "royalty_credited",       limit: 24
    t.float    "royalty_accumulated",    limit: 24
    t.string   "name",                   limit: 255
    t.integer  "status",                 limit: 4,   default: 0
    t.string   "role",                   limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "collaborators", "users"
  add_foreign_key "faculties", "users"
  add_foreign_key "ip_comms", "faculties"
  add_foreign_key "ip_comms", "ips"
  add_foreign_key "ips", "domains"
  add_foreign_key "licences", "ips"
  add_foreign_key "organisations", "users"
  add_foreign_key "stakes", "ips"
  add_foreign_key "stakes", "users", column: "stakeholder_id"
  add_foreign_key "students", "users"
end
