class CreateMedioambientes < ActiveRecord::Migration
  def change
    create_table :medioambientes do |t|
      t.references :seism, index: true
      t.integer :ciclos
      t.integer :temperatura

      t.timestamps
    end
  end
end
