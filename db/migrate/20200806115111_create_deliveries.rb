class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string       :area,       null: false
      t.integer      :leadtime,   null: false
      t.integer      :price,      null: false
      t.timestamps
    end
  end
end
