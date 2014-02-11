require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Openii" }
  subject { page }

  describe "Pagina de inicio" do
    before { visit root_path }

    it { should have_content("Openii") }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Inicio') }

    describe "para usuarios ingresados" do
      let(:user) { FactoryGirl.create(:user) }
      before do 
        FactoryGirl.create(:proyect, user: user, nombre:"Lorem ipsum")
        FactoryGirl.create(:proyect, user: user, nombre:"Dolor sit amet")
        ingreso user
        visit root_path
      end

      it "debe mostrar los proyectos del usuario" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.nombre)
        end
      end
    end
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
    before { visit new_contact_path }

    it { should have_selector('h1', text: 'Contáctanos') }
    it { should have_title(full_title('Contacto')) }
  end



end