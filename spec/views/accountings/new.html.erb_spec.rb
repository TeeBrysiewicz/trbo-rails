require 'rails_helper'

RSpec.describe "accountings/new", type: :view do
  before(:each) do
    assign(:accounting, Accounting.new(
      :name => "MyString",
      :project => nil
    ))
  end

  it "renders new accounting form" do
    render

    assert_select "form[action=?][method=?]", accountings_path, "post" do

      assert_select "input#accounting_name[name=?]", "accounting[name]"

      assert_select "input#accounting_project_id[name=?]", "accounting[project_id]"
    end
  end
end
