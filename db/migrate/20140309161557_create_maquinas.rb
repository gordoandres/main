class CreateMaquinas < ActiveRecord::Migration
  def change
    create_table :maquinas do |t|
      t.references :seism, index: true
      t.integer :capacidad
      t.integer :condicion
      t.integer :herramientas
      t.integer :ajustes
      t.integer :mantenimiento

      t.timestamps
    end
  end
end
