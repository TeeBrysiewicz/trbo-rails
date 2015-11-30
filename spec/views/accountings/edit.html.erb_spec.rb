require 'rails_helper'

RSpec.describe "accountings/edit", type: :view do
  before(:each) do
    @accounting = assign(:accounting, Accounting.create!(
      :name => "MyString",
      :project => nil
    ))
  end

  it "renders the edit accounting form" do
    render

    assert_select "form[action=?][method=?]", accounting_path(@accounting), "post" do

      assert_select "input#accounting_name[name=?]", "accounting[name]"

      assert_select "input#accounting_project_id[name=?]", "accounting[project_id]"
    end
  end
end
