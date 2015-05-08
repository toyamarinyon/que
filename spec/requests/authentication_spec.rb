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

    it "authenticate user" do
      user = create :user
      p "authenticate user"
      params[:email] = user.email
      params[:password] = user.password
      expect(user.authentication_digest).to be_nil
      post login_path, params
      user.reload
      p user
      expect(user.authentication_digest).to be_equal User.digest(user.authentication_token)
    end

  end

end
