class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.references :form, index: true, foreign_key: true
      t.integer :order, null: false
      t.integer :field_type, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :fields, :order
  end
end
