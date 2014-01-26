require 'spec_helper'

describe "Autenticacion" do

	subject { page }

  describe "pagina de ingreso" do
   	before { visit ingreso_path }

   	it { should have_content('Ingresa') }
   	it { should have_title('Ingresa') }
  end

  describe "ingreso" do
  	before { visit ingreso_path }

  	describe "con informacion invalida" do
	  	before { click_button "Ingresa" }

	  	it { should have_title('Ingresa') }
	  	it { should have_selector('div.alert.alert-error') }

	  	describe "luego de visitar otra pagina" do
	  		before { click_link "Inicio" }
	  		it { should_not have_selector('div.alert.alert-error') }
	  	end
  	end

  	describe "con informacion valida" do
  		let(:user) { FactoryGirl.create(:user) }
  		before do
  			fill_in "Email", with: user.email.upcase
  			fill_in "Password", with: user.password
  			click_button "Ingresa"
  		end
  		
  		it { should have_title(user.name) }
  		it { should have_link('Perfil', href: user_path(user)) }
  		it { should have_link('Salir', href: salir_path) }
  		it { should_not have_link('Ingresa', href: ingreso_path) }

      describe "luego de salir" do
        before { click_link "Salir" }
        it { should have_link('Ingresa') }
      end
  	end
  end
end
