require 'rails_helper'
describe ItemsController, type: :request do

  describe "GET #index" do
    it "works! (now write some real specs)" do
      get root_path
      expect(response.status).to eq 200
    end
  end
end
