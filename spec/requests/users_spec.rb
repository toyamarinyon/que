require 'rails_helper'

RSpec.describe "Users", type: :request do

  include RequestHelper

  describe "POST /users" do

    before do
      params[:name] = 'user-request1'
      params[:email] = 'user-request1@example.com'
      params[:password] = 'foobar'
    end

    it "creates user resource" do
      post users_path, user: params
      expect(response).to have_http_status(201)
    end

    it "response error message when param invalid" do
      params[:name] = ''
      params[:email] = ''
      params[:password] = ''
      post users_path, user: params
      expect(response).to have_http_status(422)
    end

  end

  describe "GET /users/:id" do

    it "show user resource" do
      user = create :user
      get user_path(user)
      expect(response).to have_http_status(200)
    end

  end

end
