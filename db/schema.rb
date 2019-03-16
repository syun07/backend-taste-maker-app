ActiveRecord::Schema.define(version: 20190316134150) do
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "taste_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tastes", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "teaser"
    t.string "wUrl"
    t.string "yUrl"
    t.string "yID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
