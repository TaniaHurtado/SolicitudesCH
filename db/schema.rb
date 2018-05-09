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

ActiveRecord::Schema.define(version: 20180508181730) do

  create_table "evaluacions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "calificacion"
    t.string   "obervacion"
    t.integer  "solicitud_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["solicitud_id"], name: "index_evaluacions_on_solicitud_id", using: :btree
  end

  create_table "solicituds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descripcion"
    t.string   "tipo"
    t.string   "importancia"
    t.string   "estado"
    t.string   "materiales"
    t.datetime "fecha"
    t.string   "lugar"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "nombre_responsable"
    t.string   "correo_responsable"
    t.integer  "ubicacion_id"
    t.index ["ubicacion_id"], name: "index_solicituds_on_ubicacion_id", using: :btree
    t.index ["user_id"], name: "index_solicituds_on_user_id", using: :btree
  end

  create_table "ubicacions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "lugar"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ubicacions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.string   "dependencia"
    t.string   "cargo"
    t.integer  "rol"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "evaluacions", "solicituds"
  add_foreign_key "solicituds", "ubicacions"
  add_foreign_key "solicituds", "users"
  add_foreign_key "ubicacions", "users"
end
