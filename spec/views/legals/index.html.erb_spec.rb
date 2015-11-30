require 'rails_helper'

RSpec.describe "legals/index", type: :view do
  before(:each) do
    assign(:legals, [
      Legal.create!(
        :name => "Name",
        :project => nil
      ),
      Legal.create!(
        :name => "Name",
        :project => nil
      )
    ])
  end

  it "renders a list of legals" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
