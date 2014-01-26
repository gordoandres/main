include ApplicationHelper

def ingreso(user, options={})
	if options[:no_capybara]
		remember_token = User.new_remember_token
		cookies[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
	else
		visit ingreso_path
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Ingresa"
	end
end