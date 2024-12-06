class CreateEventos < ActiveRecord::Migration[7.1]
  def change
    create_table :eventos do |t|
      t.string :nome
      t.string :descricao
      t.date :data
      t.time :inicio
      t.time :fim
      t.references :docente, null: false, foreign_key: true
      t.references :formacao, null: false, foreign_key: true
      t.references :sala, null: false, foreign_key: true

      t.timestamps
    end
  end
end
