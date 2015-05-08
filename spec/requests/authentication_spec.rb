require 'rails_helper'

RSpec.describe "Users", type: :request do

  include RequestHelper

  describe "POST /login" do

    it "response error message when param invalid" do
      post login_path
      expect(response).to have_http_status(422)
    end

    it "authenticate user" do
      user = create :user
      params[:email] = user.email
      params[:password] = user.password
      post login_path, params
      expect(response).to have_http_status(200)
    end

    it "authenticate user by authentication_token" do
      user = create :user
      params[:email] = user.email
      params[:password] = user.password
      expect(user.authentication_digest).to be_nil
      post login_path, params
      authentication_token = JSON.parse(response.body)["user"]["authentication_token"]
      user.reload
      expect(user.authenticated?(authentication_token)).to be_equal(true)
    end

  end

end
