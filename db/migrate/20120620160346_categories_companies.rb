class CategoriesCompanies < ActiveRecord::Migration
  def up
	create_table :categories_companies, :id => :false do |t|
	t.references :categories
	t.references :companies
	end
  end

  def down
 	drop_table :categories_companies
  end
end
