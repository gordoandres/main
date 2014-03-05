require 'spec_helper'

describe "problemas/edit" do
  before(:each) do
    @problema = assign(:problema, stub_model(Problema,
      :proyect_id => 1,
      :problema => "MyString",
      :descripcion => "MyText"
    ))
  end

  it "renders the edit problema form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", problema_path(@problema), "post" do
      assert_select "input#problema_proyect_id[name=?]", "problema[proyect_id]"
      assert_select "input#problema_problema[name=?]", "problema[problema]"
      assert_select "textarea#problema_descripcion[name=?]", "problema[descripcion]"
    end
  end
end
