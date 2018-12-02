class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.integer :year
      t.string :make
      t.string :model
      t.string :color
      t.float :wholesale_price

      t.timestamps
    end
  end
end
