require 'rails_helper'

RSpec.describe "Companies", type: :request do

  describe "GET /edit" do
    it "returns http success" do
      get "/companies/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
