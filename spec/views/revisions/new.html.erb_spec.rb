require 'rails_helper'

RSpec.describe "revisions/new", type: :view do
  before(:each) do
    assign(:revision, Revision.new(
      :name => "MyString",
      :project => nil
    ))
  end

  it "renders new revision form" do
    render

    assert_select "form[action=?][method=?]", revisions_path, "post" do

      assert_select "input#revision_name[name=?]", "revision[name]"

      assert_select "input#revision_project_id[name=?]", "revision[project_id]"
    end
  end
end
