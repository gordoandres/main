class CreateSeisms < ActiveRecord::Migration
  def change
    create_table :seisms do |t|
      t.references :problema, index: true

      t.timestamps
    end
  end
end
