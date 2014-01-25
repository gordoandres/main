require 'spec_helper'

describe "Paginas de usuarios" do
	subject { page }

	describe "pagina de registro" do
		before { visit registro_path }

		it { should have_content('Regístrate') }
		it { should have_title(full_title('Regístrate')) }
	end

end
