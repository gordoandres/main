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

  it { should be_valid }

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
    its(:remember_token) { should_not be_blank }
  end
end
