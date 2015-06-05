class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.references :sub_category, index: true, foreign_key: true
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
