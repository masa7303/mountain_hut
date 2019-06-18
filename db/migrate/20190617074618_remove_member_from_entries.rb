class RemoveMemberFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_reference :entries, :member, foreign_key: true
  end
end
