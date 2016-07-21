ActiveRecord::Schema.define(version: 20160720155903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "features", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
    t.string   "name"
    t.text     "description"
    t.date     "deadline"
    t.index ["project_id"], name: "index_features_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.text     "description"
    t.datetime "launch_date"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "feature_id"
    t.integer  "user_id"
    t.boolean  "assigned"
    t.index ["feature_id"], name: "index_requests_on_feature_id", using: :btree
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.text     "description"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "features", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "requests", "features"
  add_foreign_key "requests", "users"
end
