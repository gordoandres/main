require 'spec_helper'

describe "problemas/show" do
  before(:each) do
    @problema = assign(:problema, stub_model(Problema,
      :proyect_id => 1,
      :problema => "Problema",
      :descripcion => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Problema/)
    rendered.should match(/MyText/)
  end
end
