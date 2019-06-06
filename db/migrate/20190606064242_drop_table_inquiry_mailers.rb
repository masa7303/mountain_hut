class DropTableInquiryMailers < ActiveRecord::Migration[5.2]
  def change
     drop_table :inquiry_mailers
  end
end
