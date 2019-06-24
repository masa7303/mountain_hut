class RemoveReservationDayFromReserve < ActiveRecord::Migration[5.2]
  def change
    remove_column :reserves, :reservation_day, :date
  end
end
