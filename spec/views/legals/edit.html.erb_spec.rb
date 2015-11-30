require 'rails_helper'

RSpec.describe "legals/edit", type: :view do
  before(:each) do
    @legal = assign(:legal, Legal.create!(
      :name => "MyString",
      :project => nil
    ))
  end

  it "renders the edit legal form" do
    render

    assert_select "form[action=?][method=?]", legal_path(@legal), "post" do

      assert_select "input#legal_name[name=?]", "legal[name]"

      assert_select "input#legal_project_id[name=?]", "legal[project_id]"
    end
  end
end
