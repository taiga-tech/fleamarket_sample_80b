class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :family_name,      nill: false
      t.string      :first_name,       nill: false
      t.string      :family_name_kana, nill: false
      t.string      :first_name_kana,  nill: false
      t.string      :zipcode,          null: false
      t.string      :area,             null: false
      t.string      :city,             null: false
      t.text        :street,           null: false
      t.references  :user,             foreign_key: true
      t.timestamps
    end
  end
end
