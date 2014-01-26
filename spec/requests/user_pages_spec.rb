require 'spec_helper'

describe "Páginas de usuarios" do

	subject { page }

	describe "Pagina del perfil" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end



	describe "pagina de registro" do
    
    before { visit registro_path }

    let(:submit) { "Crear mi cuenta" }

    describe "con informacion invalida" do
      it "no debe crear un usuario" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "con informacion valida" do
      before do
        fill_in "Nombre",   with: "Usuario Ejemplo"
        fill_in "Email",  with: "usuario@ejemplo.com"
        fill_in "Password",  with: "foobar"
        fill_in "Confirma el password",   with: "foobar" 
      end

      it "debe crear un usuario" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end
