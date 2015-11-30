require 'rails_helper'

RSpec.describe "Accountings", type: :request do
  describe "GET /accountings" do
    it "works! (now write some real specs)" do
      get accountings_path
      expect(response).to have_http_status(200)
    end
  end
end
