require 'spec_helper'

describe "problemas/index" do
  before(:each) do
    assign(:problemas, [
      stub_model(Problema,
        :proyect_id => 1,
        :problema => "Problema",
        :descripcion => "MyText"
      ),
      stub_model(Problema,
        :proyect_id => 1,
        :problema => "Problema",
        :descripcion => "MyText"
      )
    ])
  end

  it "renders a list of problemas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Problema".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
