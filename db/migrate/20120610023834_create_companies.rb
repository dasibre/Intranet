class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, :null => false
      t.string :phone, :limit => 50
      t.string :fax, :limit => 50
      t.string :website
      t.integer :address_id

      t.timestamps
    end
  end

  def down
    drop_table :companies
  end
end
