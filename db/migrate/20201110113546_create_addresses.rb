class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal,        null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false 
      t.text       :address,       null: false 
      t.bigint     :buil
      t.string     :tel,           null: false
      t.references :order,         foreign_key: true

      t.timestamps
    end
  end
end
