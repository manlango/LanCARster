class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.references :customer, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.references :user, foreign_key: true
      t.float :markup
      t.float :sales_tax
      t.float :total

      t.timestamps
    end
  end
end
