class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
      t.string :nombre
      t.integer :user_id

      t.timestamps
    end
    add_index :proyects, [:user_id, :created_at]
  end
end
