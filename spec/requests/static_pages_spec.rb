require 'spec_helper'

describe "Static pages" do

  describe "Pagina de inicio" do

    it "debe tener el texto 'Inicio'" do
      visit '/static_pages/home'
      expect(page).to have_content("Inicio")
    end
  end

  describe "Pagina de ayuda" do 
  	it "debe tener el texto 'Ayuda'" do
	  	visit '/static_pages/help'
  		expect(page).to have_content('Ayuda')
  	end
  end

  describe "Acerca de" do 
  	it "debe tener el texto 'Acerca de'" do
  		visit '/static_pages/acerca_de'
  		expect(page).to have_content('Acerca de')
  	end
  end

end