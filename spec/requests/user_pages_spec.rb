require 'spec_helper'

describe "Páginas de usuarios" do

	subject { page }

  describe "index" do

    let(:user) { FactoryGirl.create(:user) }
    
    before(:each) do
      ingreso user
      visit users_path
    end

    it { should have_title('Usuarios') }
    it { should have_content('Usuarios') }

    describe "paginacion" do
      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all) { User.delete_all }

      it { should have_selector('div.pagination') }

      it "debe listar cada usuario" do
        User.paginate(page: 1).each do |user|
          expect(page).to have_selector('li', text: user.name)
        end
      end

      describe "links de borrado" do
        it { should_not have_link('borrar') }

        describe "como usuario admin" do
          let(:admin) { FactoryGirl.create(:admin) }
          before do
            ingreso admin
            visit users_path
          end

          it { should have_link('borrar', href: user_path(User.first)) }
          it "debe poder borrar otro usuario" do
            expect do
              click_link('borrar', match: :first)
            end.to change(User, :count).by(-1)
          end
          it { should_not have_link('borrar', href: user_path(admin)) }
        end
      end

    end
  end

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

      describe "despues de submit" do
        before { click_button submit }

        it { should have_title('Regístrate') }
        it { should have_content('error') }
      end

    end

    describe "con informacion valida" do
      before do
        fill_in "Nombre",   with: "Usuario Ejemplo"
        fill_in "Email",  with: "usuario@ejemplo.com"
        fill_in "Password",  with: "foobar"
        fill_in "Confirma el password",   with: "foobar" 
      end

      describe "luego de salvar al usuario" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'usuario@ejemplo.com') }

        it { should have_link('Salir') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Bienvenido') }
      end

      it "debe crear un usuario" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "editar" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      ingreso user
      visit edit_user_path(user) 
    end

    describe "pagina" do
      it { should have_content("Actualiza tu perfil") }
      it { should have_title("Editar usuario") }
      it { should have_link('cambiar', href: 'http://gravatar.com/emails') }
    end

    describe "con informacion invalida" do
      before { click_button "Guardar cambios" }

      it { should have_content('error') }
    end

    describe "con informacion valida" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Nombre",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirmar password", with: user.password
        click_button "Guardar cambios"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Salir', href: salir_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end
end
