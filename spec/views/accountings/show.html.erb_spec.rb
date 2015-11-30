require 'rails_helper'

RSpec.describe "accountings/show", type: :view do
  before(:each) do
    @accounting = assign(:accounting, Accounting.create!(
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
