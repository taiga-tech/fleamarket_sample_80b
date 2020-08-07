class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :title  
      t.string      :price 
      t.text        :text
      t.integer     :stock      
      t.string      :brand
      t.string      :condition,  null: false
      t.integer     :leadtime,   null: false
      t.references  :category,   foreign_key: true
      t.references  :user,       foreign_key: true
      t.references  :delivery,   foreign_key: true
      t.timestamps
    end
  end 
end 
