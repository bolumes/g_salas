class CreateFormacaos < ActiveRecord::Migration[7.1]
  def change
    create_table :formacaos do |t|
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
