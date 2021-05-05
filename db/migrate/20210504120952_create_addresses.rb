class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase,      null: false, foreign_key: true
      t.string     :address,   null: false
      t.integer    :prefecture_id,   null: false
      t.string     :city,   null: false
      t.string     :city_text,   null: false
      t.string     :city_building,   null: false
      t.string     :tell,   null: false
      
      t.timestamps
    end
  end
end
