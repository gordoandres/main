require 'spec_helper'

describe Proyect do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @proyect = user.proyects.build(nombre: "Panaderia Lolita") }

  subject { @proyect }

  it { should respond_to(:nombre) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "cuando un user_id no esta presente" do
  	before { @proyect.user_id = nil }
  	it { should_not be_valid }
  end

  describe "con nombre en blanco" do
    before { @proyect.nombre = " " }
    it { should_not be_valid }
  end

  describe "cuando el nombre es muy largo" do
    before { @proyect.nombre = "a" * 141 }
    it { should_not be_valid }
  end
end
