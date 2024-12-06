class CreateEdificios < ActiveRecord::Migration[7.1]
  def change
    create_table :edificios do |t|
      t.string :nome
      t.string :localiza

      t.timestamps
    end
  end
end
