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
      it { should have_link('Usuarios', href: users_path) }
  		it { should have_link('Perfil', href: user_path(user)) }
      it { should have_link('Preferencias', href: edit_user_path(user)) }
  		it { should have_link('Salir', href: salir_path) }
  		it { should_not have_link('Ingresa', href: ingreso_path) }

      describe "luego de salir" do
        before { click_link "Salir" }
        it { should have_link('Ingresa') }
      end
  	end
  end

  describe "autorizacion" do

    describe "para usuarios no ingresados" do
      let(:user) { FactoryGirl.create(:user) }

      describe "cuando trata de entrar a una pagina protegida" do
        before do
          visit edit_user_path(user)
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "Ingresa"
        end

        describe "luego de ingresar" do
          it "debe mostrar la pagina protegida deseada" do
            expect(page).to have_title('Editar usuario')
          end
        end
      end

      describe "en el controlador de proyectos" do

        describe "mandando a la accion de crear" do
          before { post proyects_path }
          specify { expect(response).to redirect_to(ingreso_path) }
        end

        describe "mandando a la accion de destruir" do
          before { delete proyect_path(FactoryGirl.create(:proyect)) }
          specify { expect(response).to redirect_to(ingreso_path) }
        end

      end

      describe "en el control de usuarios" do

        describe "visitando la pagina editar" do
          before { visit edit_user_path(user) }
          it { should have_title('Ingresa') }
        end

        describe "mandando a la accion de actualizar" do
          before { patch user_path(user) }
          specify { expect(response).to redirect_to(ingreso_path) }
        end

        describe "visitando el indice de usuarios" do
          before { visit users_path }
          it { should have_title('Ingresa') }
        end
      end
    end

    describe "como usuario incorrecto" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { ingreso user, no_capybara: true }

      describe "mandando un requerimiento GET a la accion Usuario#Editar" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match(full_title('Editar usuario')) }
        specify { expect(response).to redirect_to(root_url) }
      end

      describe "mandando un requerimiento de PATCH a la accion de Users#update" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end

    describe "como usuario no admin" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { ingreso non_admin, no_capybara: true }

      describe "mandando un pedido DELETE a una accion Users#destroy" do
        before { delete user_path(user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end
  end
end
