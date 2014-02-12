require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ContactsHelper. For example:
#
# describe ContactsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end

describe ContactsHelper do

describe "Contactanos" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      ingreso user
      visit new_contact_path
    end

#    describe "pagina" do
#      it { should have_content('Contáctanos') }
#      it { should have_title('Contacto') }
#    end

 #   describe "con informacion invalida" do
#      before { click_button "Enviar" }
#      it { should have_content('error') }
#    end

#   describe "con informacion valida" do
#      let(:new_name)  { "New Name" }
#      let(:new_email) { "new@example.com" }
#      before do
#        fill_in "Nombre",             with: new_name
#        fill_in "Email",            with: new_email
#        fill_in "Password",         with: user.password
#        fill_in "Confirmar password", with: user.password
#        click_button "Guardar cambios"
#      end

#      it { should have_title(new_name) }
#      it { should have_selector('div.alert.alert-success') }
#      it { should have_link('Salir', href: salir_path) }
#      specify { expect(user.reload.name).to  eq new_name }
#      specify { expect(user.reload.email).to eq new_email }
#   end
  end



end
