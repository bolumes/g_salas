class CreateSalas < ActiveRecord::Migration[7.1]
  def change
    create_table :salas do |t|
      t.string :nome
      t.string :capacidade
      t.boolean :projetor
      t.boolean :dispo
      t.references :edificio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
