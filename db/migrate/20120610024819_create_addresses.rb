class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_1, :null => false
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip, :limit => 5

      t.timestamps
    end
  end

  def down
    drop_table :addresses
  end
end
