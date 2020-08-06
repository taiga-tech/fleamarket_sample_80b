class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :price
      t.text :text
      t.integer :stock
      t.string :brand
      t.string :condition
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
