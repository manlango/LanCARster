class AddSaleStatusToQuotes < ActiveRecord::Migration[5.2]
  def change
   change_column :quotes, :sold, :string
  end
end
