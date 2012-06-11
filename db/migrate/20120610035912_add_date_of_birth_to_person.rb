class AddDateOfBirthToPerson < ActiveRecord::Migration
  def change
  	add_column :people, :date_of_birth, :date
  end
end
