class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :seism, index: true
      t.integer :variablilidad
      t.integer :cambios
      t.integer :proveedores
      t.integer :tipos

      t.timestamps
    end
  end
end
