require 'rails_helper'

RSpec.describe "accountings/index", type: :view do
  before(:each) do
    assign(:accountings, [
      Accounting.create!(
        :name => "Name",
        :project => nil
      ),
      Accounting.create!(
        :name => "Name",
        :project => nil
      )
    ])
  end

  it "renders a list of accountings" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
