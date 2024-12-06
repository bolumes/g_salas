class CreateDocentes < ActiveRecord::Migration[7.1]
  def change
    create_table :docentes do |t|
      t.string :nome
      t.string :email
      t.string :telefone

      t.timestamps
    end
  end
end
