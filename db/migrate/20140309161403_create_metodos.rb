class CreateMetodos < ActiveRecord::Migration
  def change
    create_table :metodos do |t|
      t.references :seism, index: true
      t.integer :estandarizacion
      t.integer :excepciones
      t.integer :definicion

      t.timestamps
    end
  end
end
