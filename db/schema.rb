# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110126112729) do

  create_table "countries", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "ic50_datas", :force => true do |t|
    t.decimal  "iC50_zanamivir_MUNANA_nm"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "iC50_zanamivir_na_star_nm"
    t.decimal  "iC50_zanamivir_other_nm"
    t.decimal  "iC50_oseltamivir_munana_nm"
    t.decimal  "iC50_oseltamivir_na_star_nm"
    t.decimal  "iC50_oseltamivir_other_nm"
    t.decimal  "iC50_amantadine_um"
    t.decimal  "iC50_rimantadine_um"
    t.string   "title"
    t.integer  "suseptibility_id"
  end

  add_index "ic50_datas", ["suseptibility_id"], :name => "index_ic50_datas_on_suseptibility_id"

  create_table "mutations", :force => true do |t|
    t.integer  "sequence_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mutations", ["sequence_id"], :name => "index_mutations_on_sequence_id"

  create_table "patients", :force => true do |t|
    t.string   "title"
    t.string   "location"
    t.date     "dob"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "suseptibility_id"
    t.boolean  "vaccinated"
    t.date     "date_onset_of_illness"
  end

  add_index "patients", ["suseptibility_id"], :name => "index_patients_on_suseptibility_id"

  create_table "sequences", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "suseptibility_id"
    t.string   "na_sequence"
    t.string   "ha_sequence"
    t.string   "m2_sequence"
    t.text     "comment"
    t.string   "title"
  end

  add_index "sequences", ["suseptibility_id"], :name => "index_sequences_on_suseptibility_id"

  create_table "suseptibilities", :force => true do |t|
    t.string   "isolate_name"
    t.date     "date_specimen_collected"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "season"
    t.string   "country"
    t.string   "virus_type"
    t.string   "source_virus"
    t.string   "title"
    t.decimal  "iC50_zanamivir_MUNANA_nm"
    t.decimal  "iC50_zanamivir_na_star_nm"
    t.decimal  "iC50_zanamivir_other_nm"
    t.decimal  "iC50_oseltamivir_munana_nm"
    t.decimal  "iC50_oseltamivir_na_star_nm"
    t.decimal  "iC50_oseltamivir_other_nm"
    t.decimal  "iC50_amantadine_um"
    t.decimal  "iC50_rimantadine_um"
    t.string   "na_sequence"
    t.string   "ha_sequence"
    t.string   "m2_sequence"
    t.text     "comment"
    t.string   "location"
    t.date     "dob"
    t.string   "gender"
    t.date     "date_onset_of_illness"
    t.boolean  "vaccinated"
    t.boolean  "hospitalised"
    t.boolean  "institution"
    t.boolean  "community"
    t.string   "other"
    t.boolean  "not_known"
  end

  create_table "task_assignments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "task_assignments", ["user_id"], :name => "index_task_assignments_on_user_id"

  create_table "thresholds", :force => true do |t|
    t.string   "season"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "virus_type"
    t.text     "description_of_how_cuttoff_values_were_calculated"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
