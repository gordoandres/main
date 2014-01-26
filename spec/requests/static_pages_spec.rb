require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Openii" }
  subject { page }

  describe "Pagina de inicio" do
    before { visit root_path }

    it { should have_content("Openii") }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Inicio') }
  end

  describe "Pagina de ayuda" do 
    before { visit help_path }

  	it { should have_content('Ayuda') }
    it { should have_title(full_title('Ayuda')) }
  end

  describe "Acerca de" do 
    before { visit acerca_de_path }

  	it { should have_content('Acerca de') }
    it { should have_title(full_title('Acerca de'))}
  end

  describe "Contacto" do
    before { visit contacto_path }

    it { should have_selector('h1', text: 'Contáctanos') }
    it { should have_title(full_title('Contacto')) }
  end



end