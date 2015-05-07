require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:params) { {} }

  describe "POST /users" do

    before do
      params[:name] = 'user-request'
      params[:email] = 'user-request@example.com'
      params[:password] = 'foobar'
    end

    it "creates post resource" do
      post users_path, user: params
      expect(response).to have_http_status(200)
    end

  end
end
