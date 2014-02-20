require 'spec_helper' 

describe "ContactForm" do 

	subject { page }


 	it "delivers a valid message" do 
 		visit new_contact_path 
 		fill_in 'Nombre', :with => 'Aaron Sumner' 
 		fill_in 'Email', :with => 'aaron@everydayrails.com' 
 		fill_in 'Mensaje', :with => 'What a great website.' 
 		click_button 'Enviar' 
 		should have_content('Tu mensaje ha sido enviado.')
 	#	last_email.to.should include('help@everydayrails.com') 
 	#	last_email.from.should include('aaron@everydayrails.com') 
 	end 

 	it "does not deliver a message with a missing email" do 
 		visit new_contact_path 
 		fill_in 'Nombre', :with => 'Aaron Sumner' 
 		fill_in 'Mensaje', :with => 'What a great website.' 
 		click_button 'Enviar' 
 		should have_content("Email can't be blank") 
 	#	last_email.should be_nil 
 	end 

 	it "does not deliver spam" do 

# 	pending "This does not appear to render the proper source but passes in a browser." 
 	visit new_contact_path 
# 	fill_in 'Nombre', :with => 'Aaron Sumner' 
# 	fill_in 'Email', :with => 'spammer@spammyjunk.com' 
# 	fill_in 'Mensaje', :with => "All the junk you'll never need." 
# 	fill_in 'nickname', :with => 'Want to buy some boots?' 
 	click_button 'Enviar' 
# 	page.body.should have_content('this message appears to be spam') 
# 	last_email.should be_nil 
 end 
end 