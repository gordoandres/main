require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Openii" }

  describe "Pagina de inicio" do

    it "debe tener el texto 'Openii'" do
      visit '/static_pages/home'
      expect(page).to have_content("Openii")
    end

    it "debe tener el titulo 'Inicio'" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title} | Inicio")
    end

  end

  describe "Pagina de ayuda" do 

  	it "debe tener el texto 'Ayuda'" do
	  	visit '/static_pages/help'
  		expect(page).to have_content('Ayuda')
  	end
    it "debe tener el titulo 'Ayuda'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Ayuda")
    end

  end

  describe "Acerca de" do 
  	it "debe tener el texto 'Acerca de'" do
  		visit '/static_pages/acerca_de'
  		expect(page).to have_content('Acerca de')
  	end

    it "debe tener el titulo 'Acerca de'" do
      visit '/static_pages/acerca_de'
      expect(page).to have_title("#{base_title} | Acerca de")
    end

  end


end