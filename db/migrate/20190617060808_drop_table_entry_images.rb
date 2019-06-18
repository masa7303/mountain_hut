class DropTableEntryImages < ActiveRecord::Migration[5.2]
  def change
    drop_table :entry_images
  end
end
