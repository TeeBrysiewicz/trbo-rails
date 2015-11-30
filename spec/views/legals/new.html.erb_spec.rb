require 'rails_helper'

RSpec.describe "legals/new", type: :view do
  before(:each) do
    assign(:legal, Legal.new(
      :name => "MyString",
      :project => nil
    ))
  end

  it "renders new legal form" do
    render

    assert_select "form[action=?][method=?]", legals_path, "post" do

      assert_select "input#legal_name[name=?]", "legal[name]"

      assert_select "input#legal_project_id[name=?]", "legal[project_id]"
    end
  end
end
