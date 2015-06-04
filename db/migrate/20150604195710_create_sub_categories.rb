class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end
    add_index :sub_categories, :slug
  end
end
