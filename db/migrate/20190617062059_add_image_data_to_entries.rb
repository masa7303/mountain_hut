class AddImageDataToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :image_data, :text
  end
end
