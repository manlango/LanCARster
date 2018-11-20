class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.integer :year
      t.string :make
      t.string :model
      t.string :color
      t.string :wholesale_price
      t.string :image_id

      t.timestamps
    end
  end
end
