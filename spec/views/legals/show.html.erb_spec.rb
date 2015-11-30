require 'rails_helper'

RSpec.describe "legals/show", type: :view do
  before(:each) do
    @legal = assign(:legal, Legal.create!(
      :name => "Name",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
