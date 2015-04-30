require 'rails_helper'

RSpec.describe "Users", type: :request do
  include RequestHelper

  describe "get /users" do

    it "returns user resource" do
      get users_path, params, env
      expect(response).to have_http_status(200)
    end

  end
end
