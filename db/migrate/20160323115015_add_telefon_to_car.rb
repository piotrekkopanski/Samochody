class AddTelefonToCar < ActiveRecord::Migration
  def change
    add_column :cars, :telefon, :fixnum
  end
end
