class RemoveStatusFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :status, :string
  end
end
