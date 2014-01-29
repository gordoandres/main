require 'spec_helper'

describe "Paginas de Proyect" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { ingreso user }

  describe "creacion de Proyect" do
    before { visit root_path }

    describe "con informacion invalida" do

      it "no debe crear un proyect" do
        expect { click_button "Crear" }.not_to change(Proyect, :count)
      end

      describe "Mensajes de error" do
        before { click_button "Crear" }
        it { should have_content('error') }
      end
    end

    describe "con informacion valida" do

      before { fill_in 'proyect_nombre', with: "Lorem ipsum" }
      it "debe crear un proyect" do
        expect { click_button "Crear" }.to change(Proyect, :count).by(1)
      end
    end
  end
end