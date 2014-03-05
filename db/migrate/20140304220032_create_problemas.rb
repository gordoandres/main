class CreateProblemas < ActiveRecord::Migration
  def change
    create_table :problemas do |t|
      t.integer :proyect_id
      t.string :problema
      t.text :descripcion

      t.timestamps
    end
    add_index :problemas, [:proyect_id, :created_at]
  end
end
