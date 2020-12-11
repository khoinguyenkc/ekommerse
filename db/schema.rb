# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_11_045747) do

  create_table "addresses", force: :cascade do |t|
    t.string "recipient_name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zipcode"
    t.string "country"
    t.integer "user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.decimal "price"
    t.integer "quantity"
    t.decimal "amount"
    t.decimal "discount", default: "0.0", null: false
    t.string "discount_note"
    t.integer "product_id"
    t.integer "cart_id"
  end

  create_table "carts", force: :cascade do |t|
    t.decimal "coupon", default: "0.0", null: false
    t.decimal "shipping"
    t.decimal "taxes"
    t.integer "order_id"
    t.decimal "subtotal"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_products_on_category_id"
    t.index ["product_id"], name: "index_category_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "total_amount"
    t.integer "address_id"
    t.boolean "paid", default: false, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.decimal "current_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "product_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.string "uid"
    t.string "password_digest"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "category_products", "categories"
  add_foreign_key "category_products", "products"
end
