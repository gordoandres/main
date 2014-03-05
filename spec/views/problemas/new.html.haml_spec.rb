require 'spec_helper'

describe "problemas/new" do
  before(:each) do
    assign(:problema, stub_model(Problema,
      :proyect_id => 1,
      :problema => "MyString",
      :descripcion => "MyText"
    ).as_new_record)
  end

  it "renders new problema form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", problemas_path, "post" do
      assert_select "input#problema_proyect_id[name=?]", "problema[proyect_id]"
      assert_select "input#problema_problema[name=?]", "problema[problema]"
      assert_select "textarea#problema_descripcion[name=?]", "problema[descripcion]"
    end
  end
end
