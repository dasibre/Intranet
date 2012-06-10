class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
    	t.string 	:title
    	t.string 	:first_name, :null => false
    	t.string 	:last_name, :null => false
    	t.string 	:email, :null => false, :limit => 100
    	t.string 	:work_phone, :limit => 50
    	t.string 	:mobile, :limit => 50
    	t.string 	:job_title
    	t.string 	:gender, :string, :limit => 1
    	t.string 	:keywords
    	t.text	 	:notes
    	t.integer 	:address_id
    	t.integer	:company_id

      t.timestamps
    end
  end

  def down
  	drop_table :people
  end
end