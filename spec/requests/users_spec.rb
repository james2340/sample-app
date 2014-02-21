require 'spec_helper'

describe "Users" do
  
	describe "signup" do

	   describe "failure" do

	      it "should not make a new user" do
	       lambda do
		visit signup_path
		fill_in "Name",    :with => " "
		fill_in "Email",   :with => " "
		fill_in "Password", :with => " "
		fill_in "Confirmation", :with => " "
	       
		response.should render_template('users/new')
		response.should have_selector("div#error_explanation")
                expect { click_button submit }.not_to change(User, :count)
	      end 
           end
	  end


	   describe "success" do

	      it "should make a new user" do
	       lambda do
		visit signup_path
		fill_in "Name",    :with => "Example User"
		fill_in "Email",   :with => "user@example.com"
		fill_in "Password", :with => "foobar"
		fill_in "Confirmation", :with => "foobar"
		
	        response.should have_selector("div.flash.success", 
					      :content => "Welcome")
		response.should render_template('users/show')
	
                expect { click_button submit }.to change(User, :count).by(1)
	        end
	      end
           end
       end
end
