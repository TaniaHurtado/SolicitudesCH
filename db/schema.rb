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

ActiveRecord::Schema.define(version: 20180615034527) do

  create_table "evaluacions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "calificacion"
    t.string   "obervacion"
    t.integer  "solicitud_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["solicitud_id"], name: "index_evaluacions_on_solicitud_id", using: :btree
  end

  create_table "informes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "archivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "motivo"
    t.string   "descripcion"
    t.integer  "solicitud_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["solicitud_id"], name: "index_observations_on_solicitud_id", using: :btree
  end

  create_table "solicituds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "descripcion"
    t.string   "tipo"
    t.string   "importancia"
    t.string   "estado"
    t.string   "materiales"
    t.string   "lugar"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "ubicacion_id"
    t.datetime "fecha_creada"
    t.datetime "fecha_notificada"
    t.datetime "fecha_aceptada"
    t.datetime "fecha_realizada"
    t.index ["ubicacion_id"], name: "index_solicituds_on_ubicacion_id", using: :btree
    t.index ["user_id"], name: "index_solicituds_on_user_id", using: :btree
  end

  create_table "ubicacions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "lugar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "users"
  end

  create_table "ubicacions_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "ubicacion_id"
    t.integer "user_id"
    t.index ["ubicacion_id"], name: "index_ubicacions_users_on_ubicacion_id", using: :btree
    t.index ["user_id"], name: "index_ubicacions_users_on_user_id", using: :btree
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.string   "dependencia"
    t.string   "cargo"
    t.integer  "rol"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "evaluacions", "solicituds"
  add_foreign_key "observations", "solicituds"
  add_foreign_key "solicituds", "ubicacions"
  add_foreign_key "solicituds", "users"
  add_foreign_key "ubicacions_users", "ubicacions"
  add_foreign_key "ubicacions_users", "users"
end
