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

ActiveRecord::Schema.define(version: 20140309161947) do

  create_table "manoobras", force: true do |t|
    t.integer  "seism_id"
    t.integer  "conocimiento"
    t.integer  "capacidad"
    t.integer  "entrenamiento"
    t.integer  "habilidad"
    t.integer  "motivacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manoobras", ["seism_id"], name: "index_manoobras_on_seism_id"

  create_table "maquinas", force: true do |t|
    t.integer  "seism_id"
    t.integer  "capacidad"
    t.integer  "condicion"
    t.integer  "herramientas"
    t.integer  "ajustes"
    t.integer  "mantenimiento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maquinas", ["seism_id"], name: "index_maquinas_on_seism_id"

  create_table "materials", force: true do |t|
    t.integer  "seism_id"
    t.integer  "variablilidad"
    t.integer  "cambios"
    t.integer  "proveedores"
    t.integer  "tipos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["seism_id"], name: "index_materials_on_seism_id"

  create_table "medicions", force: true do |t|
    t.integer  "seism_id"
    t.integer  "disponibilidad"
    t.integer  "definicion"
    t.integer  "repetibilidad"
    t.integer  "reproducibilidad"
    t.integer  "calibracion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medicions", ["seism_id"], name: "index_medicions_on_seism_id"

  create_table "medioambientes", force: true do |t|
    t.integer  "seism_id"
    t.integer  "ciclos"
    t.integer  "temperatura"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medioambientes", ["seism_id"], name: "index_medioambientes_on_seism_id"

  create_table "metodos", force: true do |t|
    t.integer  "seism_id"
    t.integer  "estandarizacion"
    t.integer  "excepciones"
    t.integer  "definicion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "metodos", ["seism_id"], name: "index_metodos_on_seism_id"

  create_table "problemas", force: true do |t|
    t.integer  "proyect_id"
    t.string   "problema"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "problemas", ["proyect_id", "created_at"], name: "index_problemas_on_proyect_id_and_created_at"

  create_table "proyects", force: true do |t|
    t.string   "nombre"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proyects", ["user_id", "created_at"], name: "index_proyects_on_user_id_and_created_at"

  create_table "seisms", force: true do |t|
    t.integer  "problema_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seisms", ["problema_id"], name: "index_seisms_on_problema_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
