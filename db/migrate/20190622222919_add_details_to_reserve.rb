class AddDetailsToReserve < ActiveRecord::Migration[5.2]
  def change
    add_column :reserves, :reservation_start, :date
    add_column :reserves, :reservation_end, :date
  end
end
