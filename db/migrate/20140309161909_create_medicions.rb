class CreateMedicions < ActiveRecord::Migration
  def change
    create_table :medicions do |t|
      t.references :seism, index: true
      t.integer :disponibilidad
      t.integer :definicion
      t.integer :repetibilidad
      t.integer :reproducibilidad
      t.integer :calibracion

      t.timestamps
    end
  end
end
