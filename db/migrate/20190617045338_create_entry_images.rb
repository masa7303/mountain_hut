class CreateEntryImages < ActiveRecord::Migration[5.2]
  def change
    create_table :entry_images do |t|
      t.references :entry
      t.string :alt_text, null: false, default: ""  # 代替テキスト
      t.integer :position                           # 表示位置

      t.timestamps
    end
  end
end
