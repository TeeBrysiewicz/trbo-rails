require 'rails_helper'

RSpec.describe "revisions/index", type: :view do
  before(:each) do
    assign(:revisions, [
      Revision.create!(
        :name => "Name",
        :project => nil
      ),
      Revision.create!(
        :name => "Name",
        :project => nil
      )
    ])
  end

  it "renders a list of revisions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
