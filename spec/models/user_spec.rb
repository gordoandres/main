require 'spec_helper'

describe User do
  
  before do
  	@user = User.new(name: "Example User", email: "user@example.com", 
  		password: "foobar", password_confirmation: "foobar") 
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }
  it { should respond_to(:proyects) }  
  it { should respond_to(:feed) }  

  it { should be_valid }
  it { should_not be_admin}

  describe "con atributo admin verdadero" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end
    it { should be_admin }
  end

  describe "cuando el nombre no esta presente" do	
  	before { @user.name = " " }
  	it { should_not be_valid }
  end

  describe "cuando el mail no esta presente" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end 

  describe "cuando el nombre es muy largo" do
  	before { @user.name = "a" * 51 }
  	it { should_not be_valid }
  end 

  describe "cuando la direccion de mail ya esta registrada" do
  	before do
  		user_with_same_email = @user.dup
  		user_with_same_email.email=@user.email.upcase
  		user_with_same_email.save
  	end
  	it { should_not be_valid }
  end

  describe "cuando el password no esta presente" do
  	before do
  		@user = User.new(name: "Example User", email: "user@example.com", 
  			password: " ", password_confirmation: " ")
  	end
  	it { should_not be_valid }
  end

  describe "cuando el password no coincide con la confirmacion" do
  	before { @user.password_confirmation = "missmatch" }
  	it { should_not be_valid }
  end

  describe "cuando el password es muy corto" do
  	before { @user.password = @user.password_confirmation = "a" * 5 }
  	it { should be_invalid }
  end

  describe "valor de retorno del metodo de autenticacion" do
  	before { @user.save }
  	let(:found_user) { User.find_by(email: @user.email) }

  	describe "con password valido" do
  		it { should eq found_user.authenticate(@user.password) }
  	end

  	describe "con password invalido" do
  		let(:user_for_invalid_password) { found_user.authenticate("invalid") }

  		it { should_not eq user_for_invalid_password }
  		specify { expect(user_for_invalid_password).to be_false }
  	end
  end

  describe "remember token" do

    before { @user.save }
    let!(:older_proyect) do
      FactoryGirl.create(:proyect, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_proyect) do
      FactoryGirl.create(:proyect, user: @user, created_at: 1.hour.ago)
    end

    its(:remember_token) { should_not be_blank }
  end

  describe "asosiaciones de proyectos" do

    before { @user.save }
    let!(:older_proyect) do
      FactoryGirl.create(:proyect, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_proyect) do
      FactoryGirl.create(:proyect, user: @user, created_at: 1.hour.ago)
    end

    it "debe tener los proyectos correctos en el orden correcto" do
      expect(@user.proyects.to_a).to eq [newer_proyect, older_proyect]
    end

    it "se deben destruir los proyectos asociados" do
      proyects = @user.proyects.to_a
      @user.destroy
      expect(proyects).not_to be_empty
      proyects.each do |proyect|
        expect(Proyect.where(id: proyect.id)).to be_empty
      end
    end

      describe "estado" do 
        let(:unfollowed_proyect) do
          FactoryGirl.create(:proyect, user: FactoryGirl.create(:user))
        end

        its(:feed) { should include(newer_proyect) }
        its(:feed) { should include(older_proyect) }
        its(:feed) { should_not include(unfollowed_proyect) }
    end
  end
end
