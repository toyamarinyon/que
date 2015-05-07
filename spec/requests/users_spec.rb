require 'rails_helper'

RSpec.describe "Users", type: :request do

  include RequestHelper

  describe "POST /users" do

    before do
      params[:name] = 'user-request1'
      params[:email] = 'user-request1@example.com'
      params[:password] = 'foobar'
    end

    it "creates post resource" do
      post users_path, user: params
      expect(response).to have_http_status(201)
    end

  end
end
