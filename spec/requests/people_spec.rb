require 'spec_helper'

describe "People" do
  describe "People Index" do
    it "should have the right title" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      page.should have_selector('title', :text => "Intranet | Home Page")
    end

    it "should have the h1 Customers" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      page.should have_selector('h1', :text => "Afrails Intranet")
    end
  end
end
