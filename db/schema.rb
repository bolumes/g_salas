# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_12_01_234715) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "docentes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edificios", force: :cascade do |t|
    t.string "nome"
    t.string "localiza"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evento_salas", force: :cascade do |t|
    t.bigint "sala_id", null: false
    t.bigint "evento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_evento_salas_on_evento_id"
    t.index ["sala_id"], name: "index_evento_salas_on_sala_id"
  end

  create_table "eventos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.date "data"
    t.time "inicio"
    t.time "fim"
    t.bigint "docente_id", null: false
    t.bigint "formacao_id", null: false
    t.bigint "sala_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["docente_id"], name: "index_eventos_on_docente_id"
    t.index ["formacao_id"], name: "index_eventos_on_formacao_id"
    t.index ["sala_id"], name: "index_eventos_on_sala_id"
  end

  create_table "formacaos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salas", force: :cascade do |t|
    t.string "nome"
    t.string "capacidade"
    t.boolean "projetor"
    t.boolean "dispo"
    t.bigint "edificio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edificio_id"], name: "index_salas_on_edificio_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "login"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "evento_salas", "eventos"
  add_foreign_key "evento_salas", "salas"
  add_foreign_key "eventos", "docentes"
  add_foreign_key "eventos", "formacaos"
  add_foreign_key "eventos", "salas"
  add_foreign_key "salas", "edificios"
end
