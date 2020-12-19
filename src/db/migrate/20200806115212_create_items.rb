class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :title,      null: false
      t.integer     :price,      null: false
      t.text        :text,       null: false
      t.integer     :stock,      null: false
      t.string      :brand
      t.string      :condition,  null: false
      t.string      :shipping,   null: false
      t.string      :leadtime,   null: false
      t.references  :category,   foreign_key: true
      t.references  :user,       foreign_key: true
      t.references  :delivery,   foreign_key: true
      t.string      :reservation_email
      t.timestamps
    end
  end
end
