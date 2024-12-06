class CreateEventoSalas < ActiveRecord::Migration[7.1]
  def change
    create_table :evento_salas do |t|
      t.references :sala, null: false, foreign_key: true
      t.references :evento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
