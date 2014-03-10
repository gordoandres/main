class CreateManoobras < ActiveRecord::Migration
  def change
    create_table :manoobras do |t|
      t.references :seism, index: true
      t.integer :conocimiento
      t.integer :capacidad
      t.integer :entrenamiento
      t.integer :habilidad
      t.integer :motivacion

      t.timestamps
    end
  end
end
