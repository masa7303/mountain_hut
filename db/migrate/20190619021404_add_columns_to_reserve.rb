class AddColumnsToReserve < ActiveRecord::Migration[5.2]
  def change
    add_column :reserves, :reservation_day, :date
    add_column :reserves, :number_of_people, :integer
    add_column :reserves, :name, :string
    add_column :reserves, :phonetic, :string
    add_column :reserves, :phone_number, :integer
    add_column :reserves, :mail, :string
    add_column :reserves, :mail_confirm, :string
    add_column :reserves, :plan, :boolean
    add_column :reserves, :password, :string
    add_column :reserves, :password_confirm, :string
  end
end
