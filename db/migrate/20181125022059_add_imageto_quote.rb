class AddImagetoQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :cover_photo, :string
  end
end
