class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :field, index: true, foreign_key: true
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :options, :name
  end
end
