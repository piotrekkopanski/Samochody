class CreateAzzets < ActiveRecord::Migration
  def change
    create_table :azzets do |t|
      t.references :car

      t.timestamps
    end
   add_index :azzets, :car_id
  end
end
