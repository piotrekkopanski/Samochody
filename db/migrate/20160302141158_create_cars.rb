class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :marka
      t.string :model
      t.text :opis
      t.decimal :rocznik
      t.decimal :cena

      t.timestamps null: false
    end
  end
end
