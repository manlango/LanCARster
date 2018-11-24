class AddSaleStatusToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :sold, :string, default: "Pending"
  end
end
